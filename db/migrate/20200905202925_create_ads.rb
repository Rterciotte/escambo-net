class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :photo
      t.integer :price
      t.integer :quantity
      t.integer :status
      
      t.timestamps
    end
  end
end
