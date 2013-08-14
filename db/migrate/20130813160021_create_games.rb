class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner_id
      t.float :winning_time
      t.string :results_url
      t.timestamps
    end
  end
end
