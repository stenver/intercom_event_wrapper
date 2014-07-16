require 'intercom'

module IntercomWrapper
  extend Intercom

  def self.post(path, payload_hash, app_id, app_api_key)
    send_request_to_path(Intercom::Request.post(path, payload_hash), app_id, app_api_key)
  end

  def self.put(path, payload_hash, app_id, app_api_key)
    send_request_to_path(Intercom::Request.put(path, payload_hash), app_id, app_api_key)
  end

  def self.send_request_to_path(request, app_id, app_api_key)
    request.execute(target_base_url(app_id, app_api_key))
  rescue Intercom::ServiceUnavailableError => e
    if Intercom::endpoints.length > 1
      retry_on_alternative_endpoint(request, app_id, app_api_key)
    else
      raise e
    end
  end

  def self.retry_on_alternative_endpoint(request, app_id, app_api_key)
    Intercom.current_endpoint = Intercom::alternative_random_endpoint
    request.execute(target_base_url, app_id, app_api_key)
  end

  def self.target_base_url(app_id, app_api_key)
    raise ArgumentError, "#{Intercom.configuration_required_text} #{Intercom.related_docs_text}" if [app_id, app_api_key].any?(&:nil?)
    basic_auth_part = "#{app_id}:#{app_api_key}@"
    Intercom.current_endpoint.gsub(/(https?:\/\/)(.*)/, "\\1#{basic_auth_part}\\2")
  end
end
