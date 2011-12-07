require 'pathname'

module SCM
  class Git
    attr_reader :binary, :revision, :path

    def initialize( directory = '.' )
      @binary = 'git'
      @revision = 0
      @path = Pathname.new( directory.to_s )
    end

    def find_version
      %x[ #{@binary} info #{@path} ] =~ /Revision: (\d+)/m
      @revision = Regexp.last_match[1].to_i unless Regexp.last_match.nil?

      @revision
    end

    def find_changes( options = {} )
      list = `git log origin/master.. --name-status --format=format: | egrep -v "^$" | sort -u`

      changes = list.map do |line|
        status, filename = line.split(/\s+/)
        change_type = case status
                      when 'M'
                        'modified'
                      when 'A'
                        'added'
                      when 'D'
                        'deleted'
                      else
                        raise line
                      end

        { :type => change_type, :file => Pathname.new(filename) }
      end
      puts changes.inspect

      changes
    end
  end
end
