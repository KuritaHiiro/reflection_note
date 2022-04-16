class MemosController < ApplicationController
  def create
    @note = Note.find(params[:note_id])
    @memo = current_user.memos.new(memo_params)
    @memo.note_id = @note.id
    if @memo.save
      redirect_to note_path(@note.id)
    else
      @note = Note.find(params[:note_id])
      @memo = Memo.new
      @memos = current_user.memos.all

      @book_marks = current_user.book_marks.all
      @book_mark_detail = BookMarkDetail.new
      render template: "notes/show"
    end
  end

  def destroy
    @note = Note.find(params[:note_id])
    Memo.find(params[:id]).destroy
    redirect_to note_path(params[:note_id])
  end

  private

  def memo_params
    params.require(:memo).permit(:memo)
  end

end
