class SessionsController < ApplicationController

  skip_before_action :authorize, only: [:new, :create]

  def new
  end

  def create
    # byebug
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      byebug
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged In!"
    else
      flash.now.alert = "Email or password is incorrect"
      render "new"
    end
  end

  def destroy
    session[:user_id]= nil
    redirect_to root_path, notice: "Logged Out!"
  end

end
