class EBox < ApplicationRecord
    has_many :delivers
    has_many :retrievals
    has_many :orders, through: :delivers
    has_many :orders, through: :retrievals
end
