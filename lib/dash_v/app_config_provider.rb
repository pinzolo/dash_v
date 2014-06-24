require 'dash_v/config_loader'
require 'dash_v/app_config'

module DashV
  class UnsupportedApplicationError < StandardError; end

  class AppConfigProvider
    def get(key)
      if has_config?(key)
        app_configs[key.to_s]
      else
        raise DashV::UnsupportedApplicationError, "#{key} is unsupported application."
      end
    end

    def has_config?(key)
      app_configs.key?(key.to_s)
    end

    private

    def app_configs
      @app_configs ||= {}.tap do |dic|
        data = DashV::ConfigLoader.load
        data.each do |key, value|
          dic[key] = DashV::AppConfig.new(value.merge('key' => key))
        end
      end
    end
  end
end
