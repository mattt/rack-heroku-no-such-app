# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rack/heroku/no-such-app"

Gem::Specification.new do |s|
  s.name        = "rack-heroku-no-such-app"
  s.authors     = ["Mattt"]
  s.email       = "mattt@me.com"
  s.license     = 'MIT'
  s.homepage    = "http://github.com/mattt/rack-heroku-no-such-app"
  s.version     = Rack::Heroku::NoSuchApp::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = "rack-heroku-no-such-app"
  s.description = "Rack middleware to prevent loading from `*.heroku.com` / `*.herokuapp.com` addresses by serving default Heroku 404 page for 'App not found'. Use in combination with custom domains."

  s.add_dependency 'rack', '~> 2.0', '>= 2.0.6'

  s.add_development_dependency "rack-test"
  s.add_development_dependency "rake"

  s.files         = Dir["./**/*"].reject { |file| file =~ /\.\/(bin|log|pkg|script|spec|test|vendor)/ }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
