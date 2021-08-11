# frozen_string_literal: true

class SerializableChannel < JSONAPI::Serializable::Resource
  type "channels"
  attribute :name
  # attribute :created_at
  # attribute :updated_at
  attribute :slug
  # attribute :posts_count
  # has_many :posts
end
