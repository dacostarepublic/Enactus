class CreateContactnumbers < ActiveRecord::Migration
  def change
    create_table :contactnumbers do |t|
      t.references :user, index: true
      t.string :contactnumber

      t.timestamps
    end
  end
end
