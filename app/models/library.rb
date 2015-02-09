# == Schema Information
#
# Table name: libraries
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Library < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :posts
end
