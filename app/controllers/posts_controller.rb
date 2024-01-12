class PostsController < ApplicationController
  def index
    @posts = @user.posts.includes(:author, comments: [:user])
  end

  def show
    @post = @user.posts.includes(:author, comments: [:user]).find(params[:id])
  end

  def create
    @post = Post.new(post_params.merge(author: @user, comments_counter: 0, likes_counter: 0))

    if @post.save
      flash[:success] = 'Post saved successfully'
    else
      flash[:error] = "An error occurred when saving your post: #{error_messages(@post)}"
    end
    redirect_to user_posts_path(@user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def error_messages(model)
    model.errors.full_messages.join(', ')
  end
end
