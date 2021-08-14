module Authorization
  extend ActiveSupport::Concern

  included do
    before_action :authorize
    helper_method :current_user
  end

  private

  def current_user
    @current_user ||= Author.find(cookies.signed[:user_id]) if cookies.signed[:user_id]
  end

  def authorize
    redirect_to root_url, alert: "Not authorized" if current_user.nil?
  end
end
