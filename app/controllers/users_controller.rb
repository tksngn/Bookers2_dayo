class UsersController < ApplicationController
  before_action :ensure_current_user, only: [:edit, :update]

    def new
      @user = User.new
    end

    def show
      @user = User.find(params[:id])
      @books = @user.books
      @book = Book.new
      @users = User.all
    end

    def edit
      @user = User.find(params[:id])
    end

    def index
      @users =User.all
      @book = Book.new
      @user = current_user
    end

    def update
      @user = User.find(params[:id])
      if @user == current_user
        if @user.update(user_params)
          do_something_after_update
          flash[:notice] = "User was successfully updated."
          redirect_to user_path(@user.id)
        else
          flash.now[:alert] = "User update failed. Please check the form for errors."
          render :edit
        end
      else
        flash[:alert] = "You do not have permission to edit this user."
        redirect_to root_path
      end
    end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction, :password, :password_confirmation)
    end

    def ensure_current_user
      user = User.find(params[:id])
      redirect_to books_path unless user == current_user
    end

    def do_something_after_update
    # 更新後の処理をここに記述
    # 例: ログを記録する、通知を送信する、など
    end

end
