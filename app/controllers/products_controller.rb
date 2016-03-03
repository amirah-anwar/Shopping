class ProductsController < ApplicationController
  before_filter :set_product, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    @product = Product.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @product = @user.products.build
    # respond_with(@product)
  end

  def edit
    @user = User.find(params[:user_id])
    @product = Product.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @product = @user.products.create(params[:product])
    redirect_to user_path(@user), notice: 'Product was successfully created.'
  end

  def update
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])
    @product.update_attributes(params[:product])
    redirect_to user_path(@user), notice: 'Product was successfully updated.'
    #respond_with(@product)
  end

  def destroy
    @user = User.find(params[:user_id])
    @product.destroy
    redirect_to user_path(@user), notice: 'Product was successfully deleted.'
    #respond_with(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
end
