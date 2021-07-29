class Channel < ApplicationRecord
  has_many :posts, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
end
