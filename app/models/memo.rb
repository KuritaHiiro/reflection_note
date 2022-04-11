class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :note

  validates :memo, presence: true
end

