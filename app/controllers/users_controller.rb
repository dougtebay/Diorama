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

  def new
    @user = User.new
  end

  def create
    @user= User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end
end
