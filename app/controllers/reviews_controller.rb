class ReviewsController < ApplicationController
  before_filter :find_review
  def create
    product = Product.find(params[:product_id])
    @review = product.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to [product], notice: 'reivew submitted!'
    else
      redirect_to [product]
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @reivew = Review.find_by(id: params[:id])
    @review.destroy
    redirect_to [@product], notice: 'Review deleted!'
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  protected
    def find_review
      unless current_user
        redirect_to root
      end
    end
end
