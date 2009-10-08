require 'test/unit/testcase'
require 'test/unit' if $0 == __FILE__
require File.dirname(__FILE__)+'/../lib/ftp_deploy.rb'

class TestFtpDeploy < Test::Unit::TestCase
  # def test_class_do_as_you_will
  #   raise NotImplementedError, 'Need to write test_class_do_as_you_will'
  # end

  def test_changes_from_scm
		assert_kind_of Array, FtpDeploy.new.changes_from_scm
  end

  # def test_currently_deployed_version
  #   raise NotImplementedError, 'Need to write test_currently_deployed_version'
  # end

  # def test_deploy
  #   raise NotImplementedError, 'Need to write test_deploy'
  # end
	
	def test_init
		assert_nil FtpDeploy.new.instance_variable_get( '@source_control' )
		assert_equal :svn, FtpDeploy.new(:scm => :svn).instance_variable_get( '@source_control' )
		
		assert_not_nil FtpDeploy.new( :host => 'ftp.netbsd.org', :user => 'anonymous', :password => 'i_want_to@get.in' ).instance_variable_get( '@ftp_connection' )
	end
end
