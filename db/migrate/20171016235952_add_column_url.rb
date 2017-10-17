class AddColumnUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :shoes, :url, :string
  end
end
