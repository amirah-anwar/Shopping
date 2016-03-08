class ReviewsController < ApplicationController
  before_filter :set_product
  before_filter :set_review, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(params[:review])
    @review.user_id = current_user.id
    @review.product_id = @product.id
    @review.save
  end

  def update
    respond_to do |format|
      if  @review.update_attributes(params[:review])
        format.html { redirect_to @product, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    redirect_to @product, notice: 'Review was successfully deleted.'
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end
end
