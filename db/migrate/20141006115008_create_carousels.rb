class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.references :item, index: true
      t.attachment :picture

      t.timestamps
    end
  end
end
