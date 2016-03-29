class SessionsController < ApplicationController

  skip_before_action :authorize

  # def new
  # end

  # def create
  #   # byebug
  #   @user = User.find_by(user_name: params[:user_name])
  #   if @user && @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect_to root_path, notice: "Logged In!"
  #   else
  #     flash.now.alert = "Email or password is incorrect"
  #     render "new"
  #   end
  # end


def create
  puts "I'm in the create action of the sessions controller!"
  auth_hash = request.env['omniauth.auth']
  @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  if @authorization
    session[:user_id] = @authorization.user.id
    redirect_to root_path
  else
    user = User.new :user_name => auth_hash.info.name, :email => auth_hash.info.email
    user.authorizations.build :provider => auth_hash.provider, :uid => auth_hash["uid"]
    user.save
    session[:user_id]= user.id
    redirect_to root_path
  end
end



  def destroy
    session[:user_id]= nil
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
