class Retrieval < ApplicationRecord
  belongs_to :retriever
  has_one :e_box
  belongs_to :order
end
