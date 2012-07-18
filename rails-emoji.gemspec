$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails-emoji/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails-emoji"
  s.version     = RailsEmoji::VERSION
  s.authors     = ["Owen Lawson"]
  s.email       = ["owen@uken.com"]
  s.homepage    = "TODO"
  s.summary     = "An Emoji conversion library for Rails"
  s.description = "Allows conversion between various Emoji sets, plus support for HTML."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"
  # s.add_dependency "jquery-rails"

  #s.add_development_dependency "sqlite3"
end