module BooksHelper
  def vote_or_unvote_btn(book)
    vote = Vote.find_by(book: book, user: current_user)
    if vote
      link_to('Unvote!', book_vote_path(id: vote.id, book_id: book.id), method: :delete)
    else
      link_to('Vote!', book_votes_path(book_id: book.id), method: :post)
    end
  end

  def vote_count(book)
    book.votes.count
  end
end
