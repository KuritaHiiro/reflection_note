class BookMarksController < ApplicationController
  def index
    @book_marks = current_user.book_marks.page(params[:page]).per(8)
    @book_mark = BookMark.new
  end

  def create
    @book_mark = BookMark.new(book_mark_params)
    @book_mark.user_id = current_user.id
    if @book_mark.save
      redirect_to book_marks_path
    else
      @book_marks = current_user.book_marks.page(params[:page]).per(8)
      @book_mark = BookMark.new
      render :index
    end
  end

  def show
    @book_mark = BookMark.find(params[:id])
    @book_mark_details = @book_mark.book_mark_details
  end

  def update
    @book_mark = BookMark.find(params[:id])
    @book_mark.update(book_mark_params)
    redirect_to book_mark_path(@book_mark.id)
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
