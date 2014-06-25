require 'dash_v/result'

module DashV
  class Invoker
    def invoke(app_config)
      command = "#{app_config.command} #{app_config.option}"
      output = exec(command)
      status = $?
      scan_data = get_scanner(app_config.scanner).scan(output)
      version = scan_data ? DashV::Version.new(scan_data) : nil
      DashV::Result.new(version: version, command: command, full_output: output, exit_status: status)
    end

    private

    def exec(command)
      `#{command}`.strip
    end

    def get_scanner(scanner_config)
      require "dash_v/scanners/#{scanner_config}_scanner"
      scanner_class_name = scanner_config.split('_').map(&:capitalize).join + 'Scanner'
      eval("DashV::Scanners::#{scanner_class_name}").new
    end
  end
end
