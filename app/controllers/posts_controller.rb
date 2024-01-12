class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author, comments: [:user])

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:author, comments: [:user]).find(params[:id])
    # @comments = @post.comments.includes(:user)

    # respond_to do |format|
    #   format.html
    #   format.json { render :json => {post: @post, comments: @comments} }
    # end
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @post.update_posts_counter
    redirect_to user_posts_path(@post.author_id), notice: 'Post deleted successfully'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def error_messages(model)
    model.errors.full_messages.join(', ')
  end
end
