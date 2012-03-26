# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ftp_deploy/version"

Gem::Specification.new do |s|
  s.name        = "ftp_deploy"
  s.version     = FtpDeploy::VERSION
  s.authors     = ["Matthias Viehweger"]
  s.email       = ["kronn@kronn.de"]
  s.homepage    = "http://github.com/kronn/ftp_deploy"
  s.summary     = %q{deploy a scm-backed directory via ftp}
  s.description = %q{A simple solution to deploy a git or subversion-backed source-directory with FTP.}

  s.rubyforge_project = "[none]"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_development_dependency "bundler"

  # s.add_runtime_dependency ""
end

