class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table :shoes do |t|
      t.string :brand
      t.string :style_name
      t.integer :size
      t.string :color
    end
  end
end
