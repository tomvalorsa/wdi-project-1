# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  image         :text
#  codepen       :text
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  codepen_embed :text
#  blurb         :text
#

class Post < ActiveRecord::Base
  has_and_belongs_to_many :libraries
  belongs_to :user

  def self.search(query)
    where("title ilike ?", "%#{query}%")
  end
end
