require 'test/unit/testcase'
require 'test/unit' if $0 == __FILE__
require 'lib/svn'

class TestSvn < Test::Unit::TestCase
	def setup
		@svn = SCM::Svn.new
	end

	def test_binary
		assert_equal 'svn', @svn.binary
	end

	def test_find_version
		assert_kind_of Fixnum, @svn.find_version
	end

	def test_revision
		assert_equal 0, @svn.revision
	end
end
