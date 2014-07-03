# Intercom-ruby wrapper

This is a simple wrapper to intercom that lets you create intercom events to multiple intercom apps from a single service. Unfortunately Intercom implementation of the ruby gem is a global singleton that demands ```app_id``` and ```app_api_key```. This means that you cannot use multiple intercom apps from within your application reliably.

This gem overloads the ::Intercom::Event.create method, so you can pass app_id and app_api_key to it. This allows you to create intercom events to multiple intercom apps from a single service.

# Installation

Add these to your gemfile:
```
gem 'intercom'
gem 'intercom_event_wrapper'
```

Require the gem somewhere
```
require 'intercom'
require 'intercom_event_wrapper'
```
# Usage
Before, if you wanted to use intercom api and wanted to create an event, you had to do something like this:
```
::Intercom.app_id = "your_app_id"
::Intercom.app_api_key = "your_app_api_key"
... # somewhere later
::Intercom::Event.create your_event_data
```

However, if you wanted to create events to different apps from a single service, you had to change the ```app_id``` and ```app_api_key``` before use. This is prone to race conditions in an asynchronous or multithreaded program.

With this wrapped you can instead just create an event like that
```
::Intercom::EventWrapper.create your_event_data, your_app_id, your_app_api_key
```

# Disclaimer

You are free to use and modify this wrapper in any way you want. You can also send me (pull)requests to update or add something new to it. I, however, will take no responsibility over anything you do with this library.
