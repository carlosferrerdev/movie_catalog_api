class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies, id: false do |t|
      t.uuid :id, primary_key: true, default: 'gen_random_uuid()'
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
