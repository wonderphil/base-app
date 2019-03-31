class AddNewsletterToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :newsletter, :bol
  end
end
