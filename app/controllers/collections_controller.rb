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
end
