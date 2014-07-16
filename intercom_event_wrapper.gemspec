# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |spec|
  spec.name        = "intercom_event_wrapper"
  spec.version     = "0.0.0"
  spec.authors     = ["Stenver Jerkku"]
  spec.email       = ["stenver1010@gmail.com"]
  spec.summary     = %q{Wrapper for Intercom api, to get around the singleton restrictions that the original intercom gem imposes on you}
  spec.description = %Q{This is a wrapper for Intercom ruby gem(https://github.com/intercom/intercom-ruby) that offers a way for the developer to fire intercom events to different interom apps from a single application or service. }
  spec.license     = "MIT"
  spec.homepage      = "https://github.com/stenver/intercom_event_wrapper"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rspec', '~>3'
  spec.add_dependency 'intercom', '~>2.1'

  spec.required_ruby_version = '~> 2.0'
end
