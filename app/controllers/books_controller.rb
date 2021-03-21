class BooksController < ApplicationController
  def index
    @user = User.find(current_user[:id])
    @book = Book.new
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
    redirect_to book_path(book.id)
    flash[:notice] = "You have created book successfully."
    else
    render :index
    end
  end

  def show

    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)

  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end
  
  def update
    
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

   private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
