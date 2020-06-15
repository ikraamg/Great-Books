class AddVotesCountToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :votes_count, :integer
  end
end
