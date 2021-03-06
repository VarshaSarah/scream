$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "scream/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "scream"
  s.version     = Scream::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Scream."
  s.description = "TODO: Description of Scream."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.1"
	s.add_dependency "devise"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'sidekiq'
  s.add_development_dependency 'mongoid'
end
