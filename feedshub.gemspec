$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "feedshub/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "feedshub"
  s.version     = Feedshub::VERSION
  s.authors     = "VAIRIX"
  s.email       = "info@vairix.com"
  s.homepage    = "http://www.vairix.com"
  s.summary     = "Created to easily integrate Github public feeds in your app"
  s.description = "You just need to follow the instruction and use the helppers and views we provide, to integrate Github public feeds in your app"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.4"
  s.add_dependency "feedzirra"
  s.add_dependency "whenever"
  s.add_dependency "figaro"
  s.add_dependency "rest-client"
  s.add_dependency "delayed_job"
  s.add_dependency "delayed_job_active_record"


  s.add_development_dependency "sqlite3"
  s.add_development_dependency "byebug"
  s.add_development_dependency "rspec-rails"
end
