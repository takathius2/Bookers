class BooksController < ApplicationController
  def top
  end

  def create
    @book = Book.new(book_params)
    if book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end
  
  def index
    @book = Book.new #<=は新規登録するための空のModelオブジェクト
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  private
  
   def book_params
   params.require(:book).permit(:title, :body)
   end
  end