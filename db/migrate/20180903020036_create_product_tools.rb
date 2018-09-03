class CreateProductTools < ActiveRecord::Migration[5.2]
  def change
    create_table :product_tools do |t|
      t.integer :product_id
      t.integer :tool_id
      t.timestamps
    end
  end
end
