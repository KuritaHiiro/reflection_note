class Note < ApplicationRecord
  belongs_to :user
  has_many :memos, dependent: :destroy
  has_many :book_mark_details, dependent: :destroy

  validates :opinion, presence: true
end
