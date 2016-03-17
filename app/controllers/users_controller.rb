# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  twitter_profile :string
#  email_add       :string
#  password        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user= User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_collection_path, notice: "Thank you for signing up! Start by creating a new collection."
    else
      render "new"
    end
  end

  private

  def users_params
    params.require(:user).permit(:user_name, :email, :password, :confirm_password)
  end
end
