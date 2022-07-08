class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def top
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
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
    @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to @book
   else
    render :edit
   end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end
  
private
  
   def book_params
    params.require(:book).permit(:title, :body)
   end
end