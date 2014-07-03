module Intercom
  @hostname = "lol"
  def self.hostname=(hostname)
    @hostname = hostname
  end
  def self.hostname
    @hostname
  end
end
