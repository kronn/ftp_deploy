# vim:ft=ruby:fileencoding=utf-8

desc "run tests"
task :test do
  require File.expand_path('../test/all', __FILE__)
end

task :guard do
  system 'rake test'
end

task :default => :test
