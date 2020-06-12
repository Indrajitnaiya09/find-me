class Profile < ApplicationRecord
    validates :first_name, presence: true, length: { minimum: 1 }, format: { with:  /\A[a-zA-Z0-9 ]+\z/ }
    validates :last_name, presence: true, length: { minimum: 1 }, format: { with:  /\A[a-zA-Z0-9 ]+\z/ }
    belongs_to :user
end
