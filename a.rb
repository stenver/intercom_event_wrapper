module Intercom
  @hostname = "lol"
  def self.change_host(hostname)
    @hostname = hostname
  end
  def self.hostname
    @hostname
  end
end

module Wrapper
  extend Intercom
  def self.included(base)
    base.send :extend, Intercom
  end
 
  def self.change_host(hostname, and_me)
    @hostname = hostname
    puts and_me
    @and_me = and_me
  end
  
  def self.hostname
    @hostname
  end
  
  def self.and_me
    @and_me
  end

  def self.intercom
    Intercom
  end
end

class A
  include Intercom
  def change_host(hostname)
    Intercom.change_host hostname
  end
  
  def print
    puts Intercom.hostname
  end

  def intercom
    Intercom
  end
end

class B
  include Wrapper
  def change_host(hostname)
    Wrapper.change_host hostname, hostname
  end

  def print
    puts Wrapper.hostname
    puts Wrapper.and_me
  end

  def wrapper
    Wrapper
  end
end

class C
  extend Intercom
  
  def change_host(hostname)
    Intercom.hostname = hostname
  end

  def print1
    puts Intercom.hostname
  end
end
