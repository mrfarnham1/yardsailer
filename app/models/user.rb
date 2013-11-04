class User < ActiveRecord::Base
  has_many :yardsales, :dependent => :delete
  has_many :favorite_yardsales, :dependent => :delete
  has_many :trips, :dependent => :delete
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  
end
