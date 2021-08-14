# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :posts, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true

  class << self
    def find_or_create_by_identity(identity)
      find_or_initialize_by(google_id: identity.user_id).tap do |author|
        author.name = identity.name
        author.email_address = identity.email_address
        author.avatar_url = identity.avatar_url
        author.save
      end
    end
  end
end
