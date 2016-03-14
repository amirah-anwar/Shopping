class ProductsController < ApplicationController
  before_filter :set_product, only: [:show, :edit, :update, :destroy, :add_to_cart]
  before_filter :authenticate_user!, only: [:new, :edit, :update, :create, :destroy, :add_to_cart]

  def index
    @products = Product.order("title").page(params[:page]).per(10)
  end

  def show
    @order = current_order
    @user = @product.user
    @reviews = @product.reviews
    @review = Review.new
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = current_user.products.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Product was successfully destroyed!.' }
      format.json { head :no_content }
    end
  end

  def add_to_cart
    @order = current_order
    @ordered_product = @order.ordered_products.new
    @ordered_product.order_id = @order.id
    @ordered_product.product_id = @product.id
    @ordered_product.save
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
end
