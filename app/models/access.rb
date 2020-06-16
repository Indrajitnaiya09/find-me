class Access < ApplicationRecord
    validates :share_type, presence: true, length: { minimum: 1 }
    has_many :location
end
