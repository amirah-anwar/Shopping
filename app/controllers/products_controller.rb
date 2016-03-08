class ProductsController < ApplicationController
  before_filter :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]
  respond_to :html

  def index
    @products = Product.all
  end

  def show
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

  private
    def set_product
      @product = Product.find(params[:id])
    end
end
