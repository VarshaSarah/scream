module Scream
  class Engine < ::Rails::Engine
    isolate_namespace Scream

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    initializer "scream.assets.precompile" do |app|
      app.config.assets.precompile += %w(scream/jquery.tokeninput.js scream/token-input-facebook.css scream/token-input.css scream/contents.js.coffee scream/screamout.js.coffee scream/screamout.css)
    end
  end
end