class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.string :body
      t.integer :score
      t.timestamps
    end
  end
end
