class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_yardsales, :dependent => :delete
  has_many :yardsales, :through => :trip_yardsales
  
  geocoded_by :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
  
  def address
    [start_address1, start_city, start_state, start_zip].compact.join(', ')
  end
  
  def address_changed?
    start_address1_changed? || start_city_changed? || start_state.changed? || start_zip.changed?
  end
end