class Location < ActiveRecord::Base

has_many :items
has_many :users, through: :items

validates_presence_of :city
validates_presence_of :state
validates_presence_of :zip_code


end
