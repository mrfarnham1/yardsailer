class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_yardsales, :dependent => :delete
  has_many :yardsales, :through => :trip_yardsales
end