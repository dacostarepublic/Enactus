class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :studentnumber
      t.references :residence
      t.datetime :toc
      t.integer :signin_count, :null=>false, :default=>0
      t.datetime :signed_in_at
      t.datetime :last_signed_in_at
      t.string :signed_in_from
      t.string :last_signed_in_from
      t.timestamps
    end

    add_index :users, :studentnumber, unique: true
  end
end
