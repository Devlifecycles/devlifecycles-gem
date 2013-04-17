require 'net/https'
require 'uri'

require 'devlifecycles/configuration'
require 'devlifecycles/railtie'
require 'devlifecycles/uses_devlifecycles'

module Devlifecycles

  def self.setup
    yield(self)
  end

  class << self
    mattr_accessor :api_key
    attr_writer :configuration

    def configure
      yield(configuration)
    end

    def reconfigure
      @configuration = Configuration.new
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def send_batch_payload(payload)
      puts "[DLC] Sending batch payload"
      uri = URI.parse(configuration.batch_endpoint)
      puts "[DLC] Using #{uri}"
      params = {:api_key => Devlifecycles.api_key, :end_users => payload.to_json}

      http = Net::HTTP.new(uri.host, uri.port)

      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data(params)
      response = http.request(request)

      if response.code == '200'
        puts "[DLC] Success"
      else
        puts "[DLC] Got unexpected status code from Devlifecycles API: #{response.code}"
        puts "[DLC] Response: #{response.body}"
      end
      response.body
   end

    def send_payload(payload)
      send_batch_payload([payload])
    end
  end
end
