class UsersController < ApplicationController

  before_action :ensure_current_user, only: [:edit, :update, :destroy]

    def show
      @user = User.find(current_user.id)
      @books = @user.books
      @book = Book.new
      @users = User.all
    end

    def new
      @user = User.new
        if @user.save
          redirect_to  new_user_registration_path(current_user.id)
        else
          render :new
        end
    end

    def create
      @user = current_user
      @book = @user.books.build(book_params)
      @book.user_id = @user.id

      if @book.save
        flash[:notice] = "You have created the book successfully."
        redirect_to book_path(@book)
      else
        flash.now[:alert] = "Book creation failed. Please check the form for errors."
        render :new
      end
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
      @user = User.find(params[:id])
      if @user.update(user_params)
      flash[:notice] = "User was successfully updated."
      redirect_to user_path(@user.id)
      else
      flash[:alert] = "User update failed. Please check the form for errors."
      render :edit
      end
    end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

    def user_params
      params.require(:user).permit(:name,:profile_image,:introduction)
    end

    def ensure_current_user
      @user = User.find(current_user.id)
      if @user.id != current_user.id
      redirect_to user_path(current_user.id)
      end
    end
end
