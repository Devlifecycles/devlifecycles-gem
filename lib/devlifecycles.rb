require 'devlifecycles/railtie'

module Devlifecycles
  mattr_accessor :api_key
  @@api_key = nil

  def self.setup
    yield(self)
  end
end
