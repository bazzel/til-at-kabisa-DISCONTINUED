class AddAttributesToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :google_id, :string
    add_index :authors, :google_id
    add_column :authors, :email_address, :string
    add_column :authors, :avatar_url, :string
  end
end
