require 'paw/stdout_output'

class StdoutOutput
    def initialize(path_state)
        @state = path_state
    end

    def write
        puts header
        @state.paths.map { |path| puts " - #{path}" }
    end

    private

    def header
        'Currently loaded path :'
    end
end
