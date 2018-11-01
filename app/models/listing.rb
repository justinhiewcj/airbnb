class Listing < ActiveRecord::Base

  # validations
  validates :name, :property_type, :place_type, :room_number, :bed_number, :guest_number, :country, :state, :city, :zipcode, :description, :price, :address, presence: true

  PROPERTY_TYPES = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample

  # relations
  belongs_to :user
  has_many :reservations
  has_many :validities
end
