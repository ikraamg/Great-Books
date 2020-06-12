class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(book_id: params[:book_id])

    if @vote.save
      redirect_to books_path, notice: 'You upvoted a book.'
    else
      redirect_to books_path, alert: 'You cannot upvote this book.'
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, book_id: params[:book_id])
    if vote
      vote.destroy
      redirect_to books_path, notice: 'You unvoted a book.'
    else
      redirect_to books_path, alert: 'You cannot unvote book that you did not vote before.'
    end
  end
end
