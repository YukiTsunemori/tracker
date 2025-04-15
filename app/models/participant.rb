class Participant < ApplicationRecord
  belongs_to :user
  validates :user_id, :workspace_id, presence: true
  belongs_to :workspace
  default_scope -> { order(created_at: :asc) }
end
