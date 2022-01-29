class App < ApplicationRecord
  has_secure_token :access_token
  has_many :chats
  validates_uniqueness_of :name , message: 'already exists'
end
