# frozen_string_literal: true

module Admin
  class PostsController < Admin::ApplicationController
    def new
      render locals: { page: Administrate::Page::Form.new(dashboard, Post.new(author: current_user)) }
    end

    def default_sorting_attribute
      :created_at
    end

    def default_sorting_direction
      :desc
    end
    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
