require 'intercom'
require 'intercom/api_operations/save'
require 'intercom/traits/api_resource'

module Intercom
  class EventWrapper
    extend Event

    def create(params, app_id, app_api_key)
      instance = self.new(params)
      instance.mark_fields_as_changed!(params.keys)
      instance.save(app_id, app_api_key)
    end

    def save(app_id, app_api_key)
      collection_name = Utils.resource_class_to_collection_name(self.class)
      if id_present? && !posted_updates?
        response = IntercomWrapper.put("/#{collection_name}/#{id}", to_submittable_hash, app_id, app_api_key)
      else
        response = IntercomWrapper.post("/#{collection_name}", to_submittable_hash.merge(identity_hash), app_id, app_api_key)
      end
      from_response(response) if response # may be nil we received back a 202
    end
  end
end
