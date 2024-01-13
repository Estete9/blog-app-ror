class Api::V1::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author, comments: [:user])

    render json: @posts
  end
end
