require 'net/ftp'
require 'pathname'

module FtpDeploy
  autoload :Worker, 'ftp_deploy/worker'
  autoload :Change, 'ftp_deploy/change'
end
