class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  respond_to :json

  def index
    respond_with (@users = User.all)
  end

  def new
    respond_with User.new
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    respond_with user
  end

  def show
    respond_with @user
  end

  def update
    respond_with @user.update(user_params)
  end

  def destroy
    respond_with @user.destroy
  end

private
  def set_user
    @user = @User.find(params[:id])
  end

  def user_params
    params.fetch(:user,{}).permit(:username, :password, :password_confirmation)
  end
end
