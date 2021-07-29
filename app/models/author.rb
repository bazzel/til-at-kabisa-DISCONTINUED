# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :posts, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
end
