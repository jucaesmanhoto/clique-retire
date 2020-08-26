class RetrieverOrder < ApplicationRecord
  belongs_to :retriever
  belongs_to :order
  belongs_to :e_box
end
