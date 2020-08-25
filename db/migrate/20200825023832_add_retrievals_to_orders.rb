class AddRetrievalsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :retrieval, null: false, foreign_key: true
  end
end
