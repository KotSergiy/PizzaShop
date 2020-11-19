class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :Orders do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.text :product_list

      t.timestamps
    end
  end
end
