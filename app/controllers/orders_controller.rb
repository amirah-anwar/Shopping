class OrdersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def show
    @order = Order.includes(:products, :ordered_products).find(params[:id])
    if current_user.id == @order.user_id
      @ordered_products = @order.ordered_products
      @products = @order.products
      @price = @order.total_price
      @discount = @order.discounted_price
    else
      flash[:alert] = "You don't have access to that order!"
      redirect_to products_path
      return
    end
  end

  def checkout
    @order = current_order
    redirect_to transactions_new_path
  end
end
