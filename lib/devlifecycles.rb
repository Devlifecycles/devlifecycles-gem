require 'devlifecycles/railtie'
require 'devlifecycles/uses_devlifecycles'

module Devlifecycles
  mattr_accessor :api_key
  @@api_key = nil

  def self.setup
    yield(self)
  end
end
