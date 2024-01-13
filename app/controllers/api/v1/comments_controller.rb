class Api::V1::CommentsController < ApplicationController
  before_action :find_post

  def index
    @comments = @post.comments.includes(:user)

    render json: @comments
  end

  def create
    @comment = @post.comments.build(comment_params.merge(user: current_user))

    render json: @comment, status: @comment.save ? :created : :unprocessable_entity
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def error_messages(model)
    model.errors.full_messages.join(', ')
  end
end
