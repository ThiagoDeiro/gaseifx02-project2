class CreateMoviesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :movies_users do |t|
      t.integer :movie_id
      t.integer :user_id
      t.timestamps
    end
  end
end
