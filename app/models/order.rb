class Order < ApplicationRecord
  has_one :payment
end
