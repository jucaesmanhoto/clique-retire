class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :state
      t.string :zip
      t.string :city

      t.timestamps
    end
  end
end
