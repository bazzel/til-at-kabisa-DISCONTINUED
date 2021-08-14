# frozen_string_literal: true

class LoginsController < ApplicationController
  def create
    if user = authenticate_with_google
      cookies.signed[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to root_url, alert: "authentication_failed"
    end
  end

  private
    def authenticate_with_google
      if id_token = flash[:google_sign_in]["id_token"]
        identity = GoogleSignIn::Identity.new(id_token)
        Author.find_or_initialize_by(google_id: identity.user_id).tap do |author|
          author.name = identity.name
          author.email_address = identity.email_address
          author.avatar_url = identity.avatar_url
          author.save
        end

      elsif error = flash[:google_sign_in]["error"]
        logger.error "Google authentication error: #{error}"
        nil
      end
    end
end
