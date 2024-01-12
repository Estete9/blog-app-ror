class CommentsController < ApplicationController
  def create
    @post = @user.posts.find(params[:post_id])
    @comment = Comment.new(comment_params.merge(user: @user, post: @post))

    if @comment.save
      flash[:success] = 'comment saved successfully'
    else
      flash[:error] = "An error occurred when saving your comment: #{error_messages(@comment)}"
    end
    redirect_to user_post_path(@user.id, @post.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@comment.post.author_id, @comment.post.id), notice: 'Comment successfully deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :text)
  end

  def error_messages(model)
    model.errors.full_messages.join(', ')
  end
end
