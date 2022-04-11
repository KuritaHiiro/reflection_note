class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      redirect_to note_path(@note.id)
    else
      render :new
    end
  end

  def index
    @notes = current_user.notes.page(params[:page]).per(8)
    @user = current_user
  end

  def show
    @note = Note.find(params[:id])
    @memo = Memo.new
    @memos = current_user.memos.all

    @book_marks = current_user.book_marks.all
    @book_mark_detail = BookMarkDetail.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to note_path(@note.id)
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:opinion, :experience, :emotion, :value)
  end
end
