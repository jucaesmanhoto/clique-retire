class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :card_number
      t.string :card_holder
      t.string :card_expiry_date
      t.string :card_cvv

      t.timestamps
    end
  end
end
