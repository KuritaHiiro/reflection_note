class BookMarksController < ApplicationController
  def index
    @book_marks = current_user.book_marks.all
    @book_mark = BookMark.new
    #@book_mark_detail.book_mark_id = @book_mark.id
  end

  def create
    @bookmark = BookMark.new(book_mark_params)
    @bookmark.user_id = current_user.id
    @bookmark.save
    redirect_to book_marks_path
  end

  def show
    @book_mark = BookMark.find(params[:id])
    @book_mark_details = @book_mark.book_mark_details
  end

  def update
    @bookmark = BookMark.find(params[:id])
    @bookmark.update(book_mark_params)
    redirect_to book_marks_path
  end

  def destroy
    @bookmark = BookMark.find(params[:id])
    @bookmark.destroy
    redirect_to book_marks_path
  end

  private

  def book_mark_params
    params.require(:book_mark).permit(:name)
  end

end
