class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :send_categories

  # GET /books
  def index
    @top_book = Book.all.includes(photo_attachment: :blob).max_by { |book| book.votes.size }
  end

  def category
    @category = params[:category]
    @category_name = Category.find(@category).name
    @books = Book.includes(:user, photo_attachment: :blob)
    @c = 0
  end

  # GET /books/1
  def show; end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    redirect_to @book and return false unless current_user == @book.user
  end

  # POST /books
  def create
    @book = Book.new(book_params.except(:category))
    @book.author_id = current_user.id

    if @book.save
      @book.books_categories.build(category_id: params[:book][:category]).save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      @book.destroy
      render :new
    end
  end

  def written
    @books = Book.all.where(author_id: current_user.id).includes(:user, :categories, photo_attachment: :blob)
    @c = 0
  end

  # PATCH/PUT /books/1
  # rubocop:disable Layout/LineLength: Line is too long
  def update
    redirect_to @book and return false unless current_user == @book.user

    if @book.update(book_params.except(:category)) && @book.books_categories.update(category_id: params[:book][:category])
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  # rubocop:enable Layout/LineLength: Line is too long
  # DELETE /books/1
  def destroy
    redirect_to @book and return false unless current_user == @book.user

    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :text, :photo, category_ids: [])
  end

  def send_categories
    @categories = Category.limit(4)
  end
end
