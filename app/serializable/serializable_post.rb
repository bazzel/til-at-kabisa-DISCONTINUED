# frozen_string_literal: true

class SerializablePost < JSONAPI::Serializable::Resource
  type "posts"
  attribute :title
  attribute :slug
  attribute :body
  # attribute :created_at
  # attribute :updated_at
  belongs_to :channel
  belongs_to :author
end
