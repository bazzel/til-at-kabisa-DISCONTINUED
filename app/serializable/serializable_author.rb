# frozen_string_literal: true

class SerializableAuthor < JSONAPI::Serializable::Resource
  type "authors"
  attribute :name
  # attribute :created_at
  # attribute :updated_at
  # attribute :posts_count
  # has_many :posts
end
