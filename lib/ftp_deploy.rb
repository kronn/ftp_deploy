require 'net/ftp'
require 'pathname'

# just to be clear, the binary does not execute any on this, yet.
# bin and lib contain essentially different approaches, right now.

module FtpDeploy
  autoload :Worker, 'ftp_deploy/worker'
  autoload :Change, 'ftp_deploy/change'
end
