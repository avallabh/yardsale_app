class Item < ActiveRecord::Base

  belongs_to :location
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :price

  validates_presence_of :user_id

  validates_presence_of :latitude
  validates_presence_of :longitude

  validates_presence_of :location_id

end
