class SessionsController < ApplicationController
  respond_to :json

  def new
  end

  def create
    @user = User.authenticate(params[:user][:username], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      respond_to do |format|
        format.json {render :json => @user}
      end
    else
      render json: {}, status: 400
    end
  end

  def destroy
    session[:user_id] = nil
    respond_with nil
  end

end
