class Order < ApplicationRecord
  belongs_to :payment
  belongs_to :deliver
  belongs_to :retrieval
  has_one :user, through: :deliver
  has_one :retriever, through: :retrieval
end
