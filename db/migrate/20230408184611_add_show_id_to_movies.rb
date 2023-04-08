class AddShowIdToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :show_id, :integer
  end
end
