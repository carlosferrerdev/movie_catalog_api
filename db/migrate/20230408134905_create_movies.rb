class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.uuid :id
      t.string :title
      t.string :genre
      t.integer :year
      t.string :country
      t.date :published_at
      t.text :description

      t.timestamps
    end
  end
end
