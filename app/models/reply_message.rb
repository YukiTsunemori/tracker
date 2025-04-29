class ReplyMessage < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :reply_content, presence: true
end