class Workspace < ApplicationRecord
  has_many :pariticipants
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 20 }
end
