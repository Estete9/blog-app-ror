class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.includes(:user)

    render json: @comments
  end


  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user: current_user))

    if @comment.save
      flash[:success] = 'comment saved successfully'
    else
      flash[:error] = "An error occurred when saving your comment: #{error_messages(@comment)}"
    end
    respond_to  do |format|
      format.html { redirect_to user_post_path(@user.id, @post.id) }
      format.json { render json: @comment, status: @comment.save ? :created : :unprocessable_entity }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @comment.update_comments_counter
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
