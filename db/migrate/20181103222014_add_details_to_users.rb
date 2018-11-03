class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name,     :string
    add_column :users, :provider, :string
    add_column :users, :uid,      :string
    add_index  :users, :uid,      unique: true
  end
end
