class Order < ApplicationRecord
  belongs_to :paymets
  has_many :deliverer_orders
  has_many :retriever_orders
  has_many :deliverers, through: :deliverer_orders
  has_many :retrievers, through: :retriever_orders
end
