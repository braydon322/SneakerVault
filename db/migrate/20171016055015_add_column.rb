class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :shoes, :user_id, :integer
  end
end
