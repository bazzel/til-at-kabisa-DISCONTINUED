# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name

      t.timestamps
    end

    add_reference :posts, :author, foreign_key: true
  end
end
