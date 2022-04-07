class BookMarkDetailsController < ApplicationController
  def create
    @book_mark_detail = BookMarkDetail.new
  end

  def destroy
  end
end
