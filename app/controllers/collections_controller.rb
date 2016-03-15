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
    @user = User.find(1)
    @collection = Collection.new(collection_params)
    if @collection.valid?
      @collection.save
      @user.collections << @collection
      redirect_to @collection 
    else
      render :new 
    end
  end

  def show
    @collection = Collection.find(params[:id])
  end

  private 

  def collection_params
    params.require(:collection).permit(:name, :description, :private?)
  end
end
