module BooksHelper
  def vote_or_unvote_btn(book)
    vote = Vote.find_by(book: book, user: current_user)
    if vote
      button_to('Unvote!', book_vote_path(id: vote.id, book_id: book.id), method: :delete)
    else
      button_to('Vote!', book_votes_path(book_id: book.id), method: :post)
    end
  end

  def standard_image
    'https://c0.wallpaperflare.com/preview/597/540/971/various-book-books-education.jpg'
  end

  def init_c
    @c = 0
  end

  def top_card(book)
    content_tag :div, class: 'card m-2 card-cat' do
      output = if book.photo.attached?
                 image_tag(book.photo, class: 'card-img-top')
               else
                 image_tag(standard_image, class: 'card-img-top', alt: 'standard image')
               end
      output << (render 'card_body', book: book)
    end
  end

  def bottom_card(book)
    content_tag :div, class: 'card m-2 card-cat' do
      output = render 'card_body', book: book
      output << if book.photo.attached?
                  image_tag(book.photo, class: 'card-img-bottom')
                else
                  image_tag(standard_image, class: 'card-img-bottom', alt: 'standard image')
                end
    end
  end

  def card_display(book)
    if book.categories.exists?(@category)
      output = top_card(book) if @c.even?
      output = bottom_card(book) if @c.odd?
    else
      @c -= 1
    end
    @c += 1
    output
  end

  def index_category_image(current_book)
    if current_book&.photo&.attached?
      image_tag(current_book.photo, class: 'card-img category-image')
    else
      image_tag(standard_image, class: 'card-img category-image', alt: 'standard image')
    end
  end

  def index_featured_image
    if @top_book&.photo&.attached?
      image_tag(@top_book.photo, class: 'card-img featured-image')
    else
      image_tag(standard_image, class: 'card-img featured-image', alt: 'standard image')
    end
  end

  def top_title
    @top_book.title if @top_book
  end

  def top_text
    @top_book.text if @top_book
  end

  def top_button
    button_to("Read More", book_path(@top_book.id), class: 'orange', method: 'get') if @top_book 
  end

  def current_book_title(current_book)
    current_book.title if current_book  
  end

end
