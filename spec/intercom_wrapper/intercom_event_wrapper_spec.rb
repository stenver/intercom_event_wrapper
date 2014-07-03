require 'spec_helper'
require 'intercom_event_wrapper'
require 'net/https'

describe Intercom::EventWrapper do

  let(:intercom_event_wrapper_class) { subject.intercom::EventWrapper }
  let(:event) {{
    event_name: "visitor-left",
    user_id: 1,
    created_at: Time.now
  }}
  let(:app_id) { "pi3243fa" }
  let(:app_api_key) { "da39a3ee5e6b4b0d3255bfef95601890afd80709" }

  # Since intercom doesnt provide free testing accounts, then this is the best test we can make.
  # Not a very good one, but if we get unauthorized exception, then we can assume that the logic at least
  # hit the right target
  it 'sends an event to intercom' do
    expect{::Intercom::EventWrapper.create event, app_id, app_api_key}.to raise_error(Intercom::AuthenticationError)
  end
end
