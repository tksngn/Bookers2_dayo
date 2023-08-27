class BooksController < ApplicationController
  def new
    @book = Book.new
    @user = User.new
  end

  def create
    @book = Book.new
    @user = User.new#(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "Book was successfully updated."
     redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.new
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body,)
  end
end
