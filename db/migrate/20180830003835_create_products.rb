class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :image
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
