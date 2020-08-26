class DelivererOrder < ApplicationRecord
  belongs_to :e_box
  belongs_to :order
  belongs_to :user
end
