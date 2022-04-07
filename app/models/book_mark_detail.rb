class BookMarkDetail < ApplicationRecord
  belongs_to :note
  belongs_to :book_mark
end
