class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    # redirect_to show_path(@book.id)
    redirect_to user_path(@book.user_id)
  end

  def update
  end

  def delete
  end

  private

  def book_params
    params.require(:book).permit(:book_title, :book_body)
  end
end