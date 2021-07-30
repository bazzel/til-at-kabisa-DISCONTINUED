class AddSlugToChannel < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :slug, :string
  end
end
