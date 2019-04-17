class BookController < ApplicationController
  def create
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
