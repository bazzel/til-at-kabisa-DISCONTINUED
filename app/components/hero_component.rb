# frozen_string_literal: true

class HeroComponent < ViewComponent::Base
  # Animations are taken from https://animate.style/
  ANIMATE = "animate"
  ANIMATED = "#{ANIMATE}__animated"
  ZOOM_IN = "#{ANIMATE}__zoomIn"
  FADE_IN = "#{ANIMATE}__fadeIn"
  DELAY = "#{ANIMATE}__delay"
  SLOW = "#{ANIMATE}__slow"

  attr_reader :subtitle, :animated

  def initialize(subtitle: nil, animated: false)
    @subtitle = subtitle
    @animated = animated
  end

  private
    def logo_class
      return unless animated?

      [ANIMATED, ZOOM_IN]
    end

    def h1_today_i_class
      return unless animated?

      [ANIMATED, FADE_IN, "#{DELAY}-1s"]
    end

    def h1_learned_class
      ["d-inline text-secondary"].tap do |h1_learned_class|
        h1_learned_class << [ANIMATED, FADE_IN, "#{DELAY}-2s"] if animated?
      end
    end

    def subtitle_class
      return unless animated?

      [ANIMATED, FADE_IN, SLOW, "#{DELAY}-3s"]
    end

    alias animated? animated
end
