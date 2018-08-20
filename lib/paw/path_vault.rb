require 'yaml'

class PathVault
    def initialize(file_path)
        @file_path = file_path
        if (File.exists?(@file_path))
            @paths = File.readlines(@file_path).map(&:strip)
        else
            @paths = []
        end
    end

    def add_path(path)
        @paths << path
    end

    def remove_path(path)
        @paths.delete(path)
    end

    def write!
        File.open(@file_path, "w") do |f|
            f.write(@paths.join("\n"))
        end
    end

    def dump
        @paths.join(':')
    end
end
