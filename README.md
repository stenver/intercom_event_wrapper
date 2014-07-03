# Intercom-ruby wrapper

This is a simple wrapper to intercom that lets you send intercom events from multiple apps. Unfortunately Intercom implementation of the ruby gem is a global singleton that demands app_id and app_api_key. This means that you cannot use multiple intercom apps from whitin your application reliably.

