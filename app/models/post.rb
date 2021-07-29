# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :channel
  belongs_to :author

  validates :title, presence: true
  validates :body, presence: true

  after_validation :set_slug, only: [:create, :update]

  def to_param
    "#{id}-#{slug}"
  end

  private
    def set_slug
      self.slug = title.to_s.parameterize
    end
end
