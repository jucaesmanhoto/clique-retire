class Retrieval < ApplicationRecord
  belongs_to :retriever
  belongs_to :e_box
  has_one :order
end
