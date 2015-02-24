class CreateItemTypes < ActiveRecord::Migration
  def change
    create_table :item_types do |t|
      t.references :item, index: true
      t.decimal :amount
      t.string :unit
      t.integer :quantity
      t.decimal :price
      t.attachment :picture
      t.integer :sold, :default=>0

      t.timestamps
    end
  end
end
