class Retriever < ApplicationRecord
    has_many :retrievals
    has_many :retrievers, through: :retrievals
    has_many :e_boxes, through: :retrievals
end
