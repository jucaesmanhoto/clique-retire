class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :price_in_cents
      t.string :status
      t.references :paymets, null: false, foreign_key: true

      t.timestamps
    end
  end
end
