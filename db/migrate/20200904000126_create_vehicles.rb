class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :bodytype
      t.integer :year
      t.string :make
      t.string :model
      t.string :color
      t.integer :mileage
      t.integer :purchase_year
      t.string :condition
      t.string :image
      t.integer :price

      t.timestamps
    end
  end
end
