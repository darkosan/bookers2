class BooksController < ApplicationController

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "successfully　created"
     redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash[:alert] = "Failed to create book: " + @book.errors.full_messages.join(", ")
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "successfully　updated"
     redirect_to book_path(current_user.id)
    else
      @books = Book.all
      flash[:alert] = "Failed to create book: " + @book.errors.full_messages.join(", ")
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:image,:title,:body)
  end

end
