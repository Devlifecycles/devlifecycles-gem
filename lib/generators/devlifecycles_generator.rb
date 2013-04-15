require 'rails/generators'
require 'rails/generators/named_base'

class DevlifecyclesGenerator < ::Rails::Generators::Base
  argument :api_key, :type => :string

  source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

  def create_initializer
    say "creating initializer..."
    if api_key_configured?
      say "No API key passed. Please run:"
      say "\n$ rails generate devlifecycles <api_key>"
      say "\nGet your API keys on http://www.devlifecycles.com"
      exit
    end
    template 'initializer.rb', 'config/initializers/devlifecycles.rb', :assigns => {:api_key => api_key}
  end

  def api_key_configured?
    File.exists?('config/initializers/devlifecycles.rb')
  end
end
