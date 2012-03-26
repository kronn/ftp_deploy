require 'helper'

class TestWorker < Test::Unit::TestCase
  # TODO
  # def test_class_do_as_you_will
  #   raise NotImplementedError, 'Need to write test_class_do_as_you_will'
  # end

  def test_changes_from_scm
    assert_kind_of Array, klass.new.changes_from_scm
  end

  # TODO
  # def test_currently_deployed_version
  #   raise NotImplementedError, 'Need to write test_currently_deployed_version'
  # end

  # TODO
  # def test_deploy
  #   raise NotImplementedError, 'Need to write test_deploy'
  # end

  def test_source_control_can_be_set
    assert_equal :svn, klass.new(:scm => :svn).source_control
    assert_equal :git, klass.new(:scm => :git).source_control
  end

  def test_git_is_default_scm
    assert_equal :git, klass.new.source_control
  end

  def test_ftp_connection_is_started
    Net::FTP.expects(:new).with('ftp.netbsd.org', 'anonymous', 'i_want_to@get.in').returns(:ftp_handle)

    assert_equal :ftp_handle, klass.new(
      :host => 'ftp.netbsd.org',
      :user => 'anonymous',
      :password => 'i_want_to@get.in'
    ).ftp_connection
  end

  def test_config_read
    assert_nothing_raised do
      config_file = Pathname.new('./config.yml')
      config_file.open('w') do |file|
        file.write <<-YAML
:server:
  :host: "ftp.netbsd.org"
  :user: "anonymous"
  :password: "i_want_to@get.in"

:scm: :svn
        YAML
      end

      fd = klass.new
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

  protected

  def klass
    FtpDeploy::Worker
  end
end
