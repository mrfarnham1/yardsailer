class TripYardsale < ActiveRecord::Base
  belongs_to :trip
  belongs_to :yardsale
  validates_uniqueness_of :yardsale_id, :scope => :trip_id
  acts_as_list :scope => :trip_id
end