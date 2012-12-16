# vim:ft=ruby:fileencoding=utf-8

require "bundler/gem_tasks"
require 'rake'

desc "run tests"
task :test do
  $:.push('.')
  $:.push('lib')
  $:.push('test')

  require './test/all'
end

task :guard do
  system 'rake test'
end

task :default => :test
