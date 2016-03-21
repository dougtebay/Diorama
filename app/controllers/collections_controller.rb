# == Schema Information
#
# Table name: collections
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :integer
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  privacy     :boolean          default(TRUE)
#

class CollectionsController < ApplicationController

before_action :authorize
before_action :authorized_to_interact

  def new
    @collection=Collection.new 
  end

  def create
    @user = User.find(session[:user_id])
    @collection = Collection.new(collection_params)
    if @collection.valid?
      @collection.save
      @user.collections << @collection
      if collection_params[:privacy]
        @collection.activate
        @collection.save
      end
      redirect_to root_path 
    else
      render :new 
    end
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def index
    @collections = Collection.all.where(privacy: false)
    @user_collections = Collection.all.where(user_id: session[:user_id])
    # @users = @collections.all.map {|col| col.user}
    @user = User.find(session[:user_id])
  end

  def destroy
    @collection = Collection.find(params[:id])
    @deleted_name = @collection.name
    @collection.destroy
    redirect_to root_path, notice: "'#{@deleted_name}' has been deleted"
  end

  def edit
    @collection=Collection.find(params[:id])
  end

  def update
    @collection=Collection.find(params[:id])
    # @collection.set_privacy(collection_params[:privacy])
      if collection_params[:privacy]
        @collection.activate
        @collection.save
      end
    if @collection.update(collection_params)
      binding.pry
      redirect_to @collection 
    else 
      render :edit 
    end
  end

  private 

  def collection_params
    params.require(:collection).permit(:name, :description, :privacy)
  end

  def authorized_to_interact
    if params[:id]
      @collection=Collection.find(params[:id])
      if session[:user_id] != @collection.user_id
        if !(@collection.privacy != true) 
          redirect_to root_path, notice: "You are not authorized to call #{params[:action]} on #{@collection.name}" 
        end
      end
    end
  end

end
