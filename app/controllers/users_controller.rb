class UsersController < ApplicationController
  def show
    # マイページを表示する
    # findは１件だけ
    # @user自分
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
    # @user_book自分が投稿した本
    @user_books = @books.where(user_id: @user.id)
    # whereは複数
    # @books = @books.where(user_id: params[:id])
    # @users = User.all
  end

  def index
    # いろんなユーザーを表示するページ
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = '編集成功！！'
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:image, :introduction)
  end
end
