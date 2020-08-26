class Payment < ApplicationRecord
    has_many :orders
end
