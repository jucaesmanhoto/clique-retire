class Order < ApplicationRecord
  belongs_to :payment
  has_many :deliverer_orders
  has_many :retriever_orders
  has_many :users, through: :deliverer_orders
  has_many :retrievers, through: :retriever_orders
end
