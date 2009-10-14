require 'test/unit/testcase'
require 'test/unit' if $0 == __FILE__
require File.dirname(__FILE__)+'/../lib/ftp_deploy/ftp_change.rb'

class TestFtpChange < Test::Unit::TestCase
  def test_class_change
		instance = FtpChange.change '../README'

		assert_kind_of FtpChange, instance
		assert_equal :put, instance.file_action
  end

  def test_class_delete
		instance = FtpChange.delete '../README'

		assert_kind_of FtpChange, instance
		assert_equal :delete, instance.file_action
  end

  def test_action
		instance = FtpChange.new '../README', FtpChange::CHANGE

		assert_kind_of Symbol, instance.action
		assert_equal :put, instance.action

		instance = FtpChange.new '.', FtpChange::CHANGE

		assert_nil instance.action
  end

  def test_base_pathnames
		instance = FtpChange.new '..'

		assert_nothing_raised do
			assert_respond_to instance, :base_pathnames
			instance.base_pathnames '.'
			instance.base_pathnames '.', '/web'
		end
  end

  # def test_directory_action
  #   raise NotImplementedError, 'Need to write test_directory_action'
  # end

  # def test_execute_via
  #   raise NotImplementedError, 'Need to write test_execute_via'
  # end

  # def test_file_action
  #   raise NotImplementedError, 'Need to write test_file_action'
  # end

  # def test_local_path
  #   raise NotImplementedError, 'Need to write test_local_path'
  # end

  # def test_remote_path
  #   raise NotImplementedError, 'Need to write test_remote_path'
  # end
end
