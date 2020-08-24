class DelivererAddress < ApplicationRecord
  belongs_to :address
  belongs_to :users
end
