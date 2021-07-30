# frozen_string_literal: true

class Channel < ApplicationRecord
  has_many :posts, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  after_validation :set_slug, only: [:create, :update]

  def to_param
    slug
  end

  private
    def set_slug
      self.slug = name.to_s.parameterize
    end
end
