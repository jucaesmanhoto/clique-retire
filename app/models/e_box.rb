class EBox < ApplicationRecord
    has_many :deliverer_orders
    has_many :retriever_orders
    has_many :orders, through: :deliverer_orders
    has_many :orders, through: :retriever_orders
end
