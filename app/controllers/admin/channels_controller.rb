# frozen_string_literal: true

module Admin
  class ChannelsController < Admin::ApplicationController
    def find_resource(param)
      Channel.find_by!(slug: param)
    end

    def default_sorting_attribute
      :name
    end
  end
end
