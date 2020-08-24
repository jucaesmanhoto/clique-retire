class DelivererOrder < ApplicationRecord
  belongs_to :deliverer_e_boxes
  belongs_to :orders
  belongs_to :users
end
