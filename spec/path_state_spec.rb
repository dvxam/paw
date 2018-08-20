require 'paw/path_state'

describe PathState do
    it '::load! initialize PathState with PATH environment variable content' do
        ENV['PATH'] = '/usr/local/bin:/usr/bin:/usr/sbin'
        state = PathState.load!
        expect(state.paths).to eq(['/usr/local/bin', '/usr/bin', '/usr/sbin'])
    end

    it '#paths returns parsed path as list' do
        state = PathState.new
        expect(state.paths).to be_empty

        state = PathState.new('')
        expect(state.paths).to be_empty

        state = PathState.new('/usr/local/:/usr/bin/')
        expect(state.paths).to eq(['/usr/local/', '/usr/bin/'])
    end

    it '#add_path' do
        state = PathState.new
        state.add_path('/my/super/path/')
        expect(state.paths).to eq(['/my/super/path/'])
    end

    it '#remove_path' do
        state = PathState.new('/usr/bin/:/usr/local/')
        state.remove_path('/usr/local/')
        expect(state.paths).to eq(['/usr/bin/'])
    end

    it '#dump' do
        ENV['PATH'] = '/usr/local/bin:/usr/bin:/usr/sbin'
        state = PathState.load!
        expect(state.dump).to eq(ENV['PATH'])

        state = PathState.new('/usr/bin/:usr/local/')
        state.add_path('/bin/')
        expect(state.dump).to eq('/usr/bin/:usr/local/:/bin/')
    end
end
