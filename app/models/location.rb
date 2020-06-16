class Location < ApplicationRecord
    validates :latitude, presence: true, length: { minimum: 1 }
    validates :longitude, presence: true, length: { minimum: 1 }
    #belongs_to :user
    belongs_to :access

    has_many :user_locations
    has_many :users, through: :user_locations
end
