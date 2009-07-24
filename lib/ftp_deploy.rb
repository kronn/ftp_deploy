class FtpDeploy
	def initialize( config = {} )
		@config = read_config.merge( config )
	end

	def deploy
	end

	protected

	def read_config
		{}
	end
end
