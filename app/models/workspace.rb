class Workspace < ApplicationRecord
  belongs_to :user
  has_many :post
  validates :name, presence: true,  length: { maximum: 50 } #, uniqueness: true
end
