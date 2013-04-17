module Devlifecycles
  class Configuration
    attr_accessor :api_key
    attr_accessor :endpoint
    attr_accessor :batch_endpoint

    DEFAULT_ENDPOINT = "http://www.devlifecycles.com/end_users/set"
    DEFAULT_BATCH_ENDPOINT = "http://www.devlifecycles.com/end_users/batch_set"

    def initialize
      @endpoint = ENV['DLC_ENDPOINT'] || DEFAULT_ENDPOINT
      @batch_endpoint = ENV['DLC_BATCH_ENDPOINT'] || DEFAULT_BATCH_ENDPOINT
    end
  end
end
