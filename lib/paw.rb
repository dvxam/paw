require 'paw/stdout_output'
require 'paw/path_state'

module Paw
    def self.list
        StdoutOutput.new(PathState.load!).write
    end
end
