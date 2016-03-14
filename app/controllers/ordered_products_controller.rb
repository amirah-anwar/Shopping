class OrderedProductsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def destroy
    @order = current_order
    @ordered_product = @order.ordered_products.find(params[:id])
    @ordered_product.destroy
    @ordered_products = @order.ordered_products

    respond_to do |format|
      format.html { redirect_to order_path(@order), notice: 'Order was removed.' }
    end
  end
end
