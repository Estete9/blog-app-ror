class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  def index
    @users = User.order(:id)
  end

  def show
    @user = User.find(params[:id])
  end
end
