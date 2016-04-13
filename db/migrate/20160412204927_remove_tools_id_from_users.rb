class RemoveToolsIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :tools_id, :integer
  end
end
