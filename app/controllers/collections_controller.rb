# == Schema Information
#
# Table name: collections
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :integer
#  description :string
#  private?    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CollectionsController < ApplicationController

  def new
    @collection=Collection.new 
  end

  def create
    @user = User.find(session[:user_id])
    @collection = Collection.new(collection_params)
    if @collection.valid?
      @collection.save
      @user.collections << @collection
      redirect_to root_path 
    else
      render :new 
    end
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def index
    @collections = Collection.all.where(user_id: session[:user_id]) 
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
    if @collection.update(collection_params)
      redirect_to @collection 
    else 
      render :edit 
    end
  end

  private 

  def collection_params
    params.require(:collection).permit(:name, :description, :private?)
  end

end
