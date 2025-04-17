class Post < ApplicationRecord
  belongs_to :user
  belongs_to :workspace
  has_many :reply_message
end
