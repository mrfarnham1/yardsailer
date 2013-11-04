class Yardsale < ActiveRecord::Base
  belongs_to :user
  has_many :trip_yardsales
  has_many :trips, :through => :trip_yardsales
  
  geocoded_by :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
  
  def address
    [address1, address2, city, state, zip].compact.join(', ')
  end
  
  def address_changed?
    address1_changed? || address2_changed? || city_changed? || state.changed? || zip.changed?
  end
end