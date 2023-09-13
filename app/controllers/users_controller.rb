class UsersController < ApplicationController
  before_action :ensure_current_user, only: [:edit, :update, :destroy]

    def new
      @user = User.new
    end

    def show
      @user = User.find(current_user.id)
      @books = @user.books
      @book = Book.new
      @users = User.all
    end

    def edit
      @user = User.find(current_user.id)
    end

    def index
      @users =User.all
      @book = Book.new
      @user = current_user
    end

    def update
      @user = User.find(current_user.id)
      if @user.update(user_params)
      flash[:notice] = "User was successfully updated."
      redirect_to user_path(@user.id)
      else
      flash.now[:alert] = "User update failed. Please check the form for errors."
      render :edit
      end
    end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

    def user_params
      params.require(:book).permit(:name, :image, :introduction)
    end

    def ensure_current_user
      @user = User.find(current_user.id)
      if @user.id != current_user.id
      redirect_to user_path(current_user.id)
      end
    end
end
