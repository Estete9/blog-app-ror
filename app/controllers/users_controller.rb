class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  def index
    @users = User.order(:id)
  end

  def show;end
end
