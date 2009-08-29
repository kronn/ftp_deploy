module SCM
	class Svn
		attr_reader :binary, :revision

		def initialize
			@binary = 'svn'
			@revision = 0
		end

		def find_version
			%x[ #{@binary} info ] =~ /Revision: (\d+)/m
			@revision = Regexp.last_match[1].to_i unless Regexp.last_match.nil?
		end
	end
end
