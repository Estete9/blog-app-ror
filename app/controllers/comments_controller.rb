class CommentsController < ApplicationController
  def create
    @user = current_user
    @post = @user.posts.find(params[:post_id])
    @comment = Comment.new(comment_params.merge(user: @user, post: @post))

    if @comment.save
      flash[:success] = 'comment saved successfully'
    else
      flash[:error] = "An error occurred when saving your comment: #{error_messages(@comment)}"
    end
    redirect_to user_post_path(@user.id, @post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :text)
  end

  def error_messages(model)
    model.errors.full_messages.join(', ')
  end
end
