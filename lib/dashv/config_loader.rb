require 'yaml'

module Dashv
  class ConfigLoader
    def self.load
      file_path = File.expand_path(File.join(File.dirname(__FILE__), '../../config/config.yml'))
      YAML.load(File.read(file_path))
    end
  end
end
