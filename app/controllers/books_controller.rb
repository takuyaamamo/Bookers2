class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    # redirect_to show_path(@book.id)
    redirect_to user_path(@book.user_id)
  end

  def show
    @users = User.all
    @abook = Book.find(params[:id])
    @user = @users.find(@abook.user_id)
    @book = Book.new
    # whereは複数
  end

  def index
    # findは１件だけ
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:notice] = '編集成功！！'
    redirect_to user_path(current_user.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path
  end

  private

  def book_params
    params.require(:book).permit(:book_title, :book_body)
  end
end
