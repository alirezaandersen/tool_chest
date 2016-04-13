class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :text
    add_column :users, :password_confirmation, :text
  end
end
