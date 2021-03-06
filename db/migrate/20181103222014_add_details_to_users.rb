class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name,     :string
    add_column :users, :role,     :integer
    add_column :users, :provider, :string
    add_column :users, :uid,      :string
    add_column :users, :all,      :string
    add_column :users, :location, :string
    add_column :users, :image,    :string
    add_column :users, :tcs,      :boolean, default: false
    add_index  :users, :uid,      unique: true
  end
end
