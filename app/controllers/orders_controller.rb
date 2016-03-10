class OrdersController < ApplicationController
  before_filter :authenticate_user!, only: :index

  def index
    @orders = Order.all
  end
end

