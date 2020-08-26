class Retriever < ApplicationRecord
    has_many :retriever_orders
    has_many :retrievers, through: :retriever_orders
    has_many :e_boxes, through: :retriever_orders
end
