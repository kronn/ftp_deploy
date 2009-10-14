require 'pathname'

module SCM
	class Svn
		attr_reader :binary, :revision, :path

		def initialize( directory = '.' )
			@binary = 'svn'
			@revision = 0
			@path = Pathname.new( directory.to_s )
		end

		def find_version
			%x[ #{@binary} info #{@path} ] =~ /Revision: (\d+)/m
			@revision = Regexp.last_match[1].to_i unless Regexp.last_match.nil?

			@revision
		end

		def find_changes( options = {} )
			changes = []

			changes << {
				:type => 'modified',
				:file => Pathname.new('.')
			}

			changes
		end
	end
end
