# == Schema Information
#
# Table name: images
#
#  id          :integer          not null, primary key
#  title       :string
#  source      :string
#  description :text
#  image_url   :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Image < ActiveRecord::Base
  has_and_belongs_to_many :libraries
  belongs_to :user
end
