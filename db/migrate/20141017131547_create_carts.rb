class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user, index: true
      t.references :item_type, index: true
      t.integer :quantity, :default=>0
      t.timestamps
    end
  end
end
