module Devlifecycles
  class Configuration
    attr_accessor :api_key
    attr_accessor :endpoint

    DEFAULT_ENDPOINT = "http://www.devlifecycles.com/end_users"

    def initialize
      @endpoint = ENV['DLC_ENDPOINT'] || DEFAULT_ENDPOINT
    end
  end
end
