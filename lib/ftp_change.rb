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

	def execute_via( ftp_connection )
		raise NotImplementedError
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
end
