class BooksController < ApplicationController


  def create
    # 1.&2.データを受け取り新規登録するためのインスタンス作成
    @book=Book.new(book_params)
    # 3.データをデータベースに保存するためのsaveメそッど実行
    if @book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end

    # 4.トップ画面にリダイレクト
    # redirect_to '/top'
    # 詳細画面にリダイレクト
    #redirect_to list_path(list.id)
  end

  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    # redirect_to book_path(book.id)
    # 3.データをデータベースに保存するためのsaveメそッど実行
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end

  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

   private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
