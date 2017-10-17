class AddColumnLink < ActiveRecord::Migration[5.1]
  def change
    add_column :shoes, :page_link, :string
  end
end
