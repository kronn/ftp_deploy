require 'net/ftp'
require 'ftp_change'

class FtpDeploy
	def initialize( config = {} )
		@config = read_config.merge( config )
		@ftp_connection = Net::FTP.new( @config[:host], @config[:user], @config[:password] )
	end

	def deploy
		changelist.each do |change|
			change.base_pathnames( @config[:local_base_path], @config[:remote_base_path] )
			change.execute_via( @ftp_connection )
		end
	end

	def read_config
		{} # hash from yaml or ruby-file
	end

	def changelist
		@changelist ||= changes_from_scm( :since => @config[:last_deployed] )
	end

	def changes_from_scm( options )
		[] # changes.each { |change| FtpChange.new( change.path, change.action ) }
	end
end
