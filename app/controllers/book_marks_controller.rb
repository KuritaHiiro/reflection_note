class BookMarksController < ApplicationController
  before_action :private_url, only:[:show, :update]

  def index
    @book_mark = BookMark.new
    @book_marks = current_user.book_marks.page(params[:page]).per(8)
  end

  def create
    @book_mark = BookMark.new(book_mark_params)
    @book_mark.user_id = current_user.id
    if @book_mark.save
      redirect_to book_marks_path
    else
      @book_marks = current_user.book_marks.page(params[:page]).per(8)
      render :index
      @book_mark = BookMark.new
    end
  end

  def show
    @book_mark = BookMark.find(params[:id])
    @book_mark_details = @book_mark.book_mark_details
  end

  def update
    @book_mark = BookMark.find(params[:id])
    if @book_mark.update(book_mark_params)
      redirect_to book_mark_path(@book_mark.id)
    else
      @book_mark_details = @book_mark.book_mark_details
      render :show
    end
  end

  def destroy
    @bookmark = BookMark.find(params[:id])
    @bookmark.destroy
    redirect_to book_marks_path
  end

  private

  def private_url
    @book_mark = BookMark.find(params[:id])
    unless @book_mark.user_id == current_user.id
      redirect_to book_marks_path
    end
  end

  def book_mark_params
    params.require(:book_mark).permit(:name)
  end

end
