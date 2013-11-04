class Yardsale < ActiveRecord::Base
  belongs_to :user
  has_many :trip_yardsales
  has_many :trips, :through => :trip_yardsales
  
  acts_as_geocodable :address => {:street => :address1, :locality => :city, :region => :state, :postal_code => :zip}
end