class PathState
    attr_reader :paths

    def self.load!
        self.new(ENV['PATH'])
    end

    def initialize(path = '')
        @paths = path.split(':')
    end

    def add_path(path)
        @paths << path
    end

    def remove_path(path)
        @paths.delete(path)
    end

    def dump
        @paths.join(':')
    end
end
