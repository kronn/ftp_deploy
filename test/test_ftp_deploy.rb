require 'test/unit/testcase'
require 'test/unit' if $0 == __FILE__

class TestFtpDeploy < Test::Unit::TestCase
  def test_class_do_as_you_will
    raise NotImplementedError, 'Need to write test_class_do_as_you_will'
  end

  def test_changes_from_scm
    raise NotImplementedError, 'Need to write test_changes_from_scm'
  end

  def test_currently_deployed_version
    raise NotImplementedError, 'Need to write test_currently_deployed_version'
  end

  def test_deploy
    raise NotImplementedError, 'Need to write test_deploy'
  end
end
