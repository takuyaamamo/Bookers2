class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      # redirect_to show_path(@book.id)
      flash[:notice] = '投稿成功！！'
      redirect_to user_path(@book.user_id)
    else
      flash[:notice] = '投稿失敗！！err'
      redirect_to user_path(@book.user_id)
    end
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
    if @book.update(book_params)
      flash[:notice] = '編集成功！！successfully'
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = '編集失敗！！error'
      render action: :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = '削除成功！！successfully'
      redirect_to user_path
    else
      flash[:notice] = '削除失敗！！error'
      redirect_to user_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:book_title, :book_body)
  end
end
