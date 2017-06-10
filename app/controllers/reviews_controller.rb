class ReviewsController < ApplicationController

  before_action :require_login

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(product_id: params[:product_id],
                         user: current_user,
                         description: params[:review]['description'],
                         rating: params[:review]['rating'])
    if @review.save
      redirect_to "/products/#{params[:product_id]}", notice: 'Your review was saved.'
    else
      redirect_to "/products/#{params[:product_id]}", notice: 'Your review was not saved'
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
    redirect_to '/'
  end

end