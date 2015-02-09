# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  image           :text
#  bio             :text
#  password_digest :string
#  is_admin        :boolean          default("false")
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_one :library
  has_many :posts
  has_secure_password

  validates :name, :uniqueness => true, :presence => true
  validates :email, :uniqueness => true, :presence => true
end
