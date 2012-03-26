require "test/helper"

class TestChange < Test::Unit::TestCase
  def test_class_change
    instance = klass.change '../README'

    assert_kind_of klass, instance
    assert_equal :put, instance.file_action
  end

  def test_class_delete
    instance = klass.delete '../README'

    assert_kind_of klass, instance
    assert_equal :delete, instance.file_action
  end

  def test_action
    instance = klass.new '../README', klass::CHANGE

    assert_kind_of Symbol, instance.action
    assert_equal :put, instance.action

    instance = klass.new '.', klass::CHANGE

    assert_nil instance.action
  end

  def test_base_pathnames
    instance = klass.new '..'

    assert_nothing_raised do
      assert_respond_to instance, :base_pathnames
      instance.base_pathnames '.'
      instance.base_pathnames '.', '/web'
    end
  end

  # TODO
  # def test_directory_action
  #   raise NotImplementedError, 'Need to write test_directory_action'
  # end

  # TODO
  # def test_execute_via
  #   raise NotImplementedError, 'Need to write test_execute_via'
  # end

  # TODO
  # def test_file_action
  #   raise NotImplementedError, 'Need to write test_file_action'
  # end

  # TODO
  # def test_local_path
  #   raise NotImplementedError, 'Need to write test_local_path'
  # end

  # TODO
  # def test_remote_path
  #   raise NotImplementedError, 'Need to write test_remote_path'
  # end

  protected

  def klass
    FtpDeploy::Change
  end
end
