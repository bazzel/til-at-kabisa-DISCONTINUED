# frozen_string_literal: true

class CreateChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :channels do |t|
      t.string :name

      t.timestamps
    end

    add_reference :posts, :channel, foreign_key: true
  end
end
