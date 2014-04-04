$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'feedshub/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'feedshub'
  s.version     = Feedshub::VERSION
  s.authors     = 'VAIRIX'
  s.email       = 'info@vairix.com'
  s.homepage    = 'https://github.com/VAIRIX/feedshub'
  s.summary     = 'Created to easily integrate Github public feeds in your app'
  s.description = 'Feedshub is a full RoR gem that let you show your company or personal github activity in a fancy way with minimal configuration.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '>= 3.2.0'
  s.add_dependency 'feedjira', '~> 1.1.0'
  s.add_dependency 'whenever', '~> 0.9.2'
  s.add_dependency 'rest-client', '~> 1.6.7'

  s.add_development_dependency 'sqlite3', '~> 1.3.9'
  s.add_development_dependency 'rspec-rails', '~> 2.14.1'
  s.add_development_dependency 'machinist', '~> 2.0'
end
