class CreateRetrievers < ActiveRecord::Migration[6.0]
  def change
    create_table :retrievers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
      t.string :document

      t.timestamps
    end
  end
end
