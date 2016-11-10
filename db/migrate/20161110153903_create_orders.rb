class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :subtotal
      t.float :sales_tax
      t.float :grand_total
      t.references :user, index: true, foreign_key: true
      t.text :order_items

      t.timestamps null: false
    end
  end
end
