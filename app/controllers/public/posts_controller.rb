class Public::PostsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @post= Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.save
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:name, :postal_code, :parking, :address, :introduction)
  end

end
