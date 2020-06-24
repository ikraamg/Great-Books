class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(book_id: params[:book_id])

    if @vote.save
      redirect_back(fallback_location: root_path, notice: 'You upvoted a book.')
    else
      redirect_back(fallback_location: root_path, alert: 'You cannot upvote this book.')
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, book_id: params[:book_id])
    if vote
      vote.destroy
      redirect_back(fallback_location: root_path, notice: 'You removed your vote')
    else
      redirect_back(fallback_location: root_path, alert: 'You have not voted as yet')
    end
  end
end
