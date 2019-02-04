class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :firstname
      t.string :lastname
      t.string :contact
      t.text :address

      t.timestamps null: false
    end
  end
end
