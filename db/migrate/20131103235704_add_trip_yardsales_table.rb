class AddTripYardsalesTable < ActiveRecord::Migration
  def self.up
    create_table :trip_yardsales do |t|
      t.integer :trip_id
      t.integer :yardsale_id
      t.integer :position
      t.integer :priority
    end
  end
  
  def self.down
    drop_table :trip_yardsales
  end
end
