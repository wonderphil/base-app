class AddTzinfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tz, :string
  end
end
