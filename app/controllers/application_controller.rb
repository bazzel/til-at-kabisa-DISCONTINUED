# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authorization
  skip_before_action :authorize
end
