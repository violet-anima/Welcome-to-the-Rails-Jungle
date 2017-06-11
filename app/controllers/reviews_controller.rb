class ReviewsController < ApplicationController

  before_action :require_login

  def create
    @product = Product.find(params[:product_id])
    @review  = Review.new review_params.merge(user_id: current_user.id, product_id: @product.id)

    if @review.save
      redirect_to @product, notice: 'Your review was saved.'
    else
      redirect_to @product, notice: 'Your review was not saved'
    end
  end

  def require_login
    unless current_user
      flash[:error] = "Please login to access this area"
      redirect_to '/login' # halts request cycle
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy

    redirect_to root_path
  end

  private

    def review_params
      params.require(:review).permit(:rating, :description)
    end
end