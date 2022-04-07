class BookMark < ApplicationRecord
  belongs_to :user
  has_many :book_mark_details, dependent: :destroy
end
