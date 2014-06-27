module Dashv
  class Result
    attr_reader :config, :version, :command, :full_output, :exit_code, :pid

    def initialize(values = {})
      @config = values[:config]
      @version = values[:version]
      @command = values[:command]
      @full_output = values[:full_output]
      @exit_code = values[:exit_status].exitstatus
      @pid = values[:exit_status].pid
    end

    def success?
      @exit_code == 0
    end

    def failure?
      !success?
    end
  end
end
