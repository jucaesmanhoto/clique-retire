class Deliver < ApplicationRecord
  belongs_to :e_box
  belongs_to :user
  has_one :order
end
