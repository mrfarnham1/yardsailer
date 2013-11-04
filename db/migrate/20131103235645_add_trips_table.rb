class AddTripsTable < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :start_address
      t.string :start_city
      t.string :start_state
      t.string :start_zip
    end
  end
  
  def self.down
    drop_table :trips
  end
end
