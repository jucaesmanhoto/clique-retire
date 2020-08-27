class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :price_in_cents
      t.string :status, default: 'placed'
      t.references :payment, null: false, foreign_key: true
      t.references :retrieval, null: false, foreign_key: true
      t.references :deliver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
