module Feedshub
  class Engine < ::Rails::Engine
    isolate_namespace Feedshub

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :machinist, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

  end
end
