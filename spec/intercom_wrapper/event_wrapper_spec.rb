require 'spec_helper'
require 'salemove/application_services/message_inbox/usage_metrics/intercom_wrapper/event_wrapper'
require 'salemove/application_services/message_inbox/usage_metrics/intercom_events_adapter'

describe Intercom::EventWrapper do
  subject {  }

  let(:intercom_event_wrapper_class) { subject.intercom::EventWrapper }
  let(:event) {
    event_name: "test_event_name",
    user: "test_user_name",
    originator_id: "123",
    created_at: Time.now
  }

  it 'sends an event to intercom' do
    intercom_event_class.create
  end
end
