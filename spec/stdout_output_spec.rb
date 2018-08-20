require 'paw/path_state'
require 'paw/stdout_output'

describe StdoutOutput do
    it 'shows output' do
        output = StdoutOutput.new(PathState.new('/usr/bin/:/usr/local/'))
        expect { output.write }.to output(
            <<~END.gsub(/^\s*\|/, "")
            |Currently loaded path :
            | - /usr/bin/
            | - /usr/local/
            END
        ).to_stdout
    end
end
