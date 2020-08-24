class CreateDelivererAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :deliverer_addresses do |t|
      t.references :address, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
