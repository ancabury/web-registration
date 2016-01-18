class AddColumnUser < ActiveRecord::Migration
  def change
    add_column :users, :sex, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
  end
end
