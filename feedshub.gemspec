$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'feedshub/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'feedshub'
  s.version     = Feedshub::VERSION
  s.authors     = 'VAIRIX'
  s.email       = 'info@vairix.com'
  s.homepage    = 'http://www.vairix.com'
  s.summary     = 'Created to easily integrate Github public feeds in your app'
  s.description = 'You just need to follow the instruction and use the helppers and views we provide, to integrate Github public feeds in your app'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.0.0', '>= 4.0.0'
  s.add_dependency 'feedzirra', '~> 0'
  s.add_dependency 'whenever', '~> 0'
  s.add_dependency 'figaro', '~> 0'
  s.add_dependency 'rest-client', '~> 0'

  s.add_development_dependency 'sqlite3', '~> 0'
  s.add_development_dependency 'byebug', '~> 0'
  s.add_development_dependency 'rspec-rails', '~> 0'
end
