class FavoriteYardsale < ActiveRecord::Base
  belongs_to :user
  belongs_to :yardsale
end