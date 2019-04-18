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
    # パラムスとカレントが違う場合飛ばす
    if params[:id] == current_user.id.to_s
      @user = User.find(params[:id])
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
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

  def user_params
    params.require(:user).permit(:image, :introduction,:name)
  end
end
