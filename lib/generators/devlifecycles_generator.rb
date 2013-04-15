require 'rails/generators'
require 'rails/generators/named_base'

class DevlifecyclesGenerator < ::Rails::Generators::Base
  source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

  def create_initializer
    say "creating initializer..."
    template 'initializer.rb', 'config/initializers/devlifecycles.rb'
  end
end
