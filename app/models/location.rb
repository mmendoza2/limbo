class Location < ActiveRecord::Base

  attr_accessible :address, :latitude, :longitude, :city

  reverse_geocoded_by :latitude, :longitude, :address => :location
  after_validation :reverse_geocode

end


