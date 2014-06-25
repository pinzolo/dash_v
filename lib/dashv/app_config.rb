module Dashv
  class InvalidConfigurationError < StandardError; end

  class AppConfig
    attr_reader :key, :name, :command, :option, :scanner

    def initialize(values = {})
      validate_scanner(values['scanner'])

      @key     = values['key']
      @name    = values['name']
      @command = values['command']
      @option  = values['option']  || '--version'
      @scanner = values['scanner'] || 'simple'
    end

    private

    def validate_scanner(scanner)
      files = Dir.glob(File.expand_path(File.join(File.dirname(__FILE__), "scanners/*.rb"))).map { |file| File.basename(file) }
      if scanner && !files.include?("#{scanner}_scanner.rb")
        raise Dashv::InvalidConfigurationError, "#{scanner} is invalid as scanner name."
      end
    end
  end
end
