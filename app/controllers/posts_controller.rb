class PostsController < ApplicationController
  def index
    @posts = Post.order(:id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_url
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:genre, :content)
  end
end
