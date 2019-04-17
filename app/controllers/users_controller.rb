class UsersController < ApplicationController
  def show
    # findは１件だけ
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
    # whereは複数
    @user_books = @books.where(user_id: params[:id])
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
