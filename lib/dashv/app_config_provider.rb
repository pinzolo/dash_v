require 'dashv/config_loader'
require 'dashv/app_config'

module Dashv
  class UnsupportedApplicationError < StandardError; end

  class AppConfigProvider
    def get(key)
      if has_config?(key)
        app_configs[key.to_s]
      else
        raise Dashv::UnsupportedApplicationError, "#{key} is unsupported application."
      end
    end

    def has_config?(key)
      app_configs.key?(key.to_s)
    end

    private

    def app_configs
      @app_configs ||= {}.tap do |dic|
        data = Dashv::ConfigLoader.load
        data.each do |key, value|
          dic[key] = Dashv::AppConfig.new(value.merge('key' => key))
        end
      end
    end
  end
end
