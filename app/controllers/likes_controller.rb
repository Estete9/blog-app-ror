class LikesController < ApplicationController
  def create
    @user = current_user
    @post = @user.posts.find(params[:post_id])
    @like = Like.new(user: @user, post: @post)

    if @like.save
      flash[:success] = 'like saved successfully'
    else
      flash[:error] = "An error occurred when saving your comment: #{error_messages(@like)}"
    end

    redirect_to user_posts_path(@post.author_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :text)
  end

  def error_messages(model)
    model.errors.full_messages.join(', ')
  end
end
