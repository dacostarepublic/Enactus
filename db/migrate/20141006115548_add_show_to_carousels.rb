class AddShowToCarousels < ActiveRecord::Migration
  def change
    add_column :carousels, :show, :boolean, :default=>false
  end
end
