class Message < ApplicationRecord
  belongs_to :chat, counter_cache: true
  searchkick filterable: [:id]
end
