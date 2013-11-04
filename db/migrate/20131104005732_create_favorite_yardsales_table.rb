class CreateFavoriteYardsalesTable < ActiveRecord::Migration
  def change
    create_table :favorite_yardsales do |t|
      t.integer :user_id
      t.integer :yardsale_id
    end
  end
end
