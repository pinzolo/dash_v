require 'dashv/result'

module Dashv
  class Invoker
    def invoke(app_config)
      command = "#{app_config.command} #{app_config.option}"
      output = exec(command)
      status = $?
      scan_data = get_scanner(app_config.scanner).scan(output)
      version = scan_data ? Dashv::Version.new(scan_data) : nil
      Dashv::Result.new(version: version, command: command, full_output: output, exit_status: status)
    end

    private

    def exec(command)
      `#{command}`.strip
    rescue => e
      e.message
    end

    def get_scanner(scanner_config)
      require "dashv/scanners/#{scanner_config}_scanner"
      scanner_class_name = scanner_config.split('_').map(&:capitalize).join + 'Scanner'
      eval("Dashv::Scanners::#{scanner_class_name}").new
    end
  end
end
