require "bundler"
Bundler.setup

gemspec = eval(File.read("rack-heroku-no-such-app.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["rack-heroku-no-such-app.gemspec"] do
  system "gem build rack-heroku-no-such-app.gemspec"
  system "gem install rack-heroku-no-such-app-#{Rack::Heroku::NoSuchApp::VERSION}.gem"
end
