class TransactionsController < ApplicationController
  before_filter :authenticate_user!

  def new
    gon.client_token = generate_client_token
  end

  def create
    @order = current_order
    @ordered_products = @order.ordered_products
    @result = Braintree::Transaction.sale(
              amount: @order.discounted_price,
              payment_method_nonce: params[:payment_method_nonce])

    @order.complete!
    if @result.success?
      UserMailer.transaction_confirmation(current_user, @order, @ordered_products).deliver
      redirect_to root_url, notice: "Congratulations! Your transaction has been successfull!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end

  private

  def generate_client_token
    Braintree::ClientToken.generate
  end
end
