class Chat < ApplicationRecord
  belongs_to :app, counter_cache: true
  has_many :messages
end
