require 'pathname'
class FtpChange
	CHANGE = :change
	DELETE = :delete

	def initialize( path, action = CHANGE )
		@path = Pathname.new(path.to_s)
		@action = action
	end

	def self.delete( path )
		self.new(path, DELETE)
	end
	def self.change( path )
		self.new(path, CHANGE)
	end

	def base_pathnames( local, remote = nil )
		@local_base = Pathname.new(local.to_s).realpath
		@remote_base = Pathname.new(remote.to_s)
	end

	def execute_via( ftp_connection )
		case @action
		when DELETE then ftp_connection.send( action, remote_path )
		else ftp_connection.send( action, local_path, remote_path )
		end
	end
	
	def action
		if @path.directory?
			directory_action
		else
			file_action
		end
	end

	def directory_action
		case @action
		when CHANGE then nil
		when DELETE then :rmdir
		else nil
		end
	end

	def file_action
		case @action
		when CHANGE then :put
		when DELETE then :delete
		else :put
		end
	end

	def local_path
		@path.relative_path_from(@local_base)
	end

	def remote_path
		@remote_base + @path.relative_path_from(@local_base)
	end
end
