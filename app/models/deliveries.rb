class Deliveries < ApplicationRecord
  belongs_to :user
  has_one :e_box
  belongs_to :order
end
