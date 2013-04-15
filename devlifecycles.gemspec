$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devlifecycles/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devlifecycles"
  s.version     = Devlifecycles::VERSION
  s.authors     = ["Dave Paola"]
  s.email       = ["dpaola2@gmail.com"]
  s.homepage    = "http://www.devlifecycles.com"
  s.summary     = "Rails plugin for Devlifecycles."
  s.description = "Rails plugin for Devlifecycles."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.11"
end
