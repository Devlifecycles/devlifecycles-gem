module Devlifecycles
  class Railtie < ::Rails::Railtie
    rake_tasks do
      require 'devlifecycles/rake_tasks'
    end
  end
end
