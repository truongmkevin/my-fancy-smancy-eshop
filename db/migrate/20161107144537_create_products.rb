class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :size
      t.text :description
      t.integer :quantity
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
