class BookMarkDetailsController < ApplicationController
  def create
    @book_mark_detail = BookMarkDetail.new(book_mark_detail_params)
    @book_mark_detail.note_id = @book_mark_detail.note.id
    @book_mark_detail.book_mark_id = @book_mark_detail.book_mark.id
    if @book_mark_detail.save
      redirect_to book_mark_path(@book_mark_detail.book_mark.id)
    else
      @note = Note.find(params[:id])
      @memo = Memo.new
      @memos = current_user.memos.all
      @book_marks = current_user.book_marks.all
      @book_mark_detail = BookMarkDetail.new
      render template: "notes/show"
    end
  end

  def destroy
    @book_mark_detail = BookMarkDetail.find(params[:id])
    @book_mark_detail.destroy
    redirect_to book_mark_path(@book_mark_detail.book_mark.id)
  end

  private

  def book_mark_detail_params
    params.require(:book_mark_detail).permit(:note_id, :book_mark_id)
  end
end
