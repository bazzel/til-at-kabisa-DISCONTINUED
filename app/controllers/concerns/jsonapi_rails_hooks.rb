# frozen_string_literal: true

module JsonapiRailsHooks
  extend ActiveSupport::Concern

  def jsonapi_pagination(collection)
    return {} unless collection.is_a?(ActiveRecord::Relation)

    {
      self: url_for(format: :json, page: collection.current_page),
      first: url_for(format: :json, page: 1),
      prev: collection.first_page? ? nil : url_for(format: :json, page: collection.prev_page),
      next: collection.last_page? ? nil : url_for(format: :json, page: collection.next_page),
      last: url_for(format: :json, page: collection.total_pages)
    }
  end

  def jsonapi_meta
    collection = instance_variable_get("@#{controller_name}")
    return nil unless collection.is_a?(ActiveRecord::Relation)

    {
      totalPages: collection.total_pages
    }
  end
end
