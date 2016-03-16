class SessionsController < ApplicationController

  def new
  end

  def create
    #byebug
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Logged In!"
    else
      flash.now.alert = "Email or password is incorrect"
      render "new"
    end
  end

  def destroy
  end
end
