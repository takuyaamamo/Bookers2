class BookController < ApplicationController
  def create
    @book.save
    # redirect_to show_path(@book.id)
    redirect_to root
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
