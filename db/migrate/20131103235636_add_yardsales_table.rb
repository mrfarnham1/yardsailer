class AddYardsalesTable < ActiveRecord::Migration
  def self.up
    create_table :yardsales do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :caption
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :featured, :default => false
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
  
  def self.down
    drop_table :yardsales
  end
end
