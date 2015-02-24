class AddReservedToItemType < ActiveRecord::Migration
  def change
    add_column :item_types, :reserved, :integer, :default=>0
  end
end
