class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table(:categories_items, :id=>:false) do |t|
    	t.references :category
    	t.references :item
    end

    add_index(:categories, :name)
    add_index(:categories_items, [:category_id, :item_id])
  end
end
