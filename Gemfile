source :rubygems

# Specify your gem's dependencies in ftp_deploy.gemspec
gemspec

group :development do
  gem 'redgreen'

  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rake'
  if Config::CONFIG['host_os'] =~ /linux/
    gem 'libnotify'
  end

  gem 'mocha'

  gem 'pry'
end
