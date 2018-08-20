class PathState
    attr_reader :paths

    def initialize(path = '')
        @paths = path.split(':')
    end

    def dump
        @paths.join(':')
    end
end
