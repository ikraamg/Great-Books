class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer :author_id
      t.string :title
      t.text :text
      t.string :image

      t.timestamps
    end
  end
end
