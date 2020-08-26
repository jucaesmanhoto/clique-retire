class CreateRetrieverOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :retriever_orders do |t|
      t.string :qr_code
      t.references :e_box, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.references :retriever, null: false, foreign_key: true

      t.timestamps
    end
  end
end
