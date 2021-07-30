class AddCounterCacheToChannel < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :posts_count, :integer, default: 0
  end
end
