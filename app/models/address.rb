class Address < ApplicationRecord
    has_many :deliverer_addresses
    has_many :users, through: :deliverer_addresses
end
