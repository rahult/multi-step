$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "multi-step/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "multi-step"
  s.version     = MultiStep::VERSION
  s.authors     = ["Rahul Trikha"]
  s.email       = ["rahul.trikha@gmail.com"]
  s.homepage    = "https://github.com/rahult/multi-step"
  s.summary     = "Multi-Step is a Rails engine for easily creating multi step forms (i.e. form wizard)"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.9"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "rb-fsevent"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "growl"
  s.add_development_dependency "pry"
end
