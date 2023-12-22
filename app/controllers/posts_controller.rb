class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    return unless @post.save

    redirect_to user_posts_path(@user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
