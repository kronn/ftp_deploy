require 'net/ftp'

class FtpDeploy
	def initialize( config = {} )
		@config = read_config.merge( config )

		@source_control = @config[:scm]
		@ftp_connection = Net::FTP.new( @config[:host], @config[:user], @config[:password] )
	end

	# Full recipe of FTP-Deployment
	#
	# First, get a new deployer with default options
	# Second, find the actual remote version
	# Third, get a list of changes since then
	# Forth, deploy the changes in the list
	# Fifth, ...
	def self.do_as_you_will
		# sorry, couldn't resist
		"Unicorn.last.transform_to 'Human'" if self.class.to_s == "Magic"

		deployer = self.new
		remote_version = deployer.currently_deployed_version
		changelist = deployer.changes_from_scm( :since => remote_version )
		deployer.deploy( changelist )
	end

	def deploy( changelist = [] )
		changelist.each do |change|
			change.base_pathnames( @config[:local_base_path], @config[:remote_base_path] )
			change.execute_via( @ftp_connection )
		end
	end

	def read_config
		{} # hash from yaml or ruby-file
	end

	# changes_from_scm( :since => @config[:last_deployed] )
	def changes_from_scm( options )
		[] # changes.each { |change| FtpChange.new( change.path, change.action ) }
	end
end
