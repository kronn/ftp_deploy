require 'test/unit/testcase'
require 'test/unit' if $0 == __FILE__
require File.dirname(__FILE__)+'/../lib/ftp_deploy.rb'
require 'pathname'

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
    # assert_nil FtpDeploy.new.instance_variable_get( '@source_control' )
    assert_equal :svn, FtpDeploy.new(:scm => :svn).instance_variable_get( '@source_control' )

    assert_not_nil FtpDeploy.new( :host => 'ftp.netbsd.org', :user => 'anonymous', :password => 'i_want_to@get.in' ).instance_variable_get( '@ftp_connection' )
  end

  def test_config_read
    assert_nothing_raised do
      config_file = Pathname.new('./config.yml')
      config_file.open('w') do |file|
        file.write <<YAML
:server:
  :host: "ftp.netbsd.org"
  :user: "anonymous"
  :password: "i_want_to@get.in"

:scm: :svn
YAML
      end

      fd = FtpDeploy.new
      config = fd.instance_variable_get( '@config' )
      expected = {
        :server => { :host => 'ftp.netbsd.org', :user => 'anonymous', :password => 'i_want_to@get.in' },
        :scm => :svn,
        :deployed_version_file => 'REVISION'
      }

      assert_not_nil config
      assert_equal expected, config

      config_file.unlink
    end
  end
end
