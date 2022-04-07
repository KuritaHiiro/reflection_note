class MemosController < ApplicationController
  def create
    @note = Note.find(params[:note_id])
    @memo = current_user.memos.new(memo_params)
    @memo.note_id = @note.id
    @memo.save
    redirect_to note_path(@note.id)
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
