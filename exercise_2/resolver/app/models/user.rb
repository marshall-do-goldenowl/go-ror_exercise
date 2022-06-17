# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true

  has_many :user_relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :followeds, through: :user_relationships
  has_many :followings, foreign_key: 'followed_id', class_name: 'UserRelationship', dependent: :destroy
end
