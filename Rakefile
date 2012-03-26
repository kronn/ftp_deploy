# vim:ft=ruby:fileencoding=utf-8
#
# require 'rubygems'
# require 'bundler'
# begin
#   Bundler.setup(:default, :development)
# rescue Bundler::BundlerError => e
#   $stderr.puts e.message
#   $stderr.puts "Run `bundle install` to install missing gems"
#   exit e.status_code
# end
require "bundler/gem_tasks"
require 'rake'

desc "run tests"
task :test do
  $:.push(File.expand_path('../lib/', __FILE__))
  $:.push(File.expand_path('../test/', __FILE__))

  require './test/all'
end

task :guard do
  system 'rake test'
end

task :default => :test
