class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :size
      t.string :apparel_type
      t.string :category
      t.integer :price_per_cycle
      t.string :color
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
