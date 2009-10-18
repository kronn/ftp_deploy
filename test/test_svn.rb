require 'test/unit/testcase'
require 'test/unit' if $0 == __FILE__
require 'lib/ftp_deploy/svn'

class TestSvn < Test::Unit::TestCase
	def setup
		@test_svn_dir = Pathname.new './example_svn_dir'
		@svn = SCM::Svn.new(@test_svn_dir.to_s)
	end


	def test_binary
		assert_equal 'svn', @svn.binary
	end

	def test_path
		assert_respond_to @svn, :path
		assert_kind_of Pathname, @svn.path
	end

	def test_standard_project_directory
		svn = SCM::Svn.new
		assert_equal '.', svn.path.to_s
	end

	def test_custom_project_directory
		svn = SCM::Svn.new('./example_svn_dir')
		assert_equal './example_svn_dir', svn.path.to_s
	end

	def test_find_version
		with_svn_dir do
			assert_kind_of Fixnum, @svn.find_version
			assert_equal 200, @svn.find_version
		end
	end

	def test_revision
		assert_equal 0, @svn.revision
	end

	def test_find_changes
		assert_kind_of Array, @svn.find_changes
	end

	def test_find_changes_since_revision
		assert_kind_of Array, @svn.find_changes(:since => 10)
	end

	def test_first_change_is_a_specific_hash
		changes = @svn.find_changes :since => 10

		assert_kind_of Hash, changes.first
		assert_match /added|modified|deleted/, changes.first[:type]
		assert_kind_of Pathname, changes.first[:file]
	end

	protected

	def common_setup
		system "svn co -r200 http://svn.assembla.com/svn/federleicht/trunk/fl/interfaces/ #{@test_svn_dir} 1>/dev/null 2>/dev/null"
	end
	def common_teardown
		system "rm -rf #{@test_svn_dir}"
	end
	def with_svn_dir( &block )
		common_setup
		yield
		common_teardown
	end
end
