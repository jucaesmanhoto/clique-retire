class CreateEBoxes < ActiveRecord::Migration[6.0]
  def change
    create_table :e_boxes do |t|
      t.string :e_box_code
      t.string :compartiment_size

      t.timestamps
    end
  end
end
