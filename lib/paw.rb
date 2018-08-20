require 'paw/stdout_output'
require 'paw/path_vault'
require 'paw/path_state'

module Paw

    VAULT_LOCATION = "#{Dir.home}/.bash_paw"
    PATH_VAR = ENV['PATH']

    def self.list
        state = PathState.new(PATH_VAR)
        StdoutOutput.new(state).write
    end

    def self.add(path)
        vault = PathVault.new(VAULT_LOCATION)
        vault.add_path(path)
        vault.write!
        puts "Added '#{path}' to #{VAULT_LOCATION}"
    end

    def self.remove(path)
        vault = PathVault.new(VAULT_LOCATION)
        vault.remove_path(path)
        vault.write!
        puts "Removed '#{path}' from #{VAULT_LOCATION}"
    end

    def self.dump
        state = PathState.new(PATH_VAR)
        vault = PathVault.new(VAULT_LOCATION)
        puts "export PATH='" + [state, vault].map(&:dump).join(':') + "';"
    end

    # allow to add path to PATH (dump them to file)
    # allow to source the created file
    # list show which one is added
    # allow to remove path to PATH
    # 'doctor' command to check sanitization :
    #  - check format
    #  - check for duplication
    #  - check warning (read doc)
end
