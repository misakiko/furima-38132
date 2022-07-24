class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_cord, null: false
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :block_number, null: false
      t.string :building
      t.string :phone_number, null: false
      t.references :purchase, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
