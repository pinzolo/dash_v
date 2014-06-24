require 'dash_v/gem_version'
require 'dash_v/version'
require 'dash_v/invoker'
require 'dash_v/app_config_provider'

module DashV
  def self.[](key)
    app_config = app_config_provider.get(key)
    DashV::Invoker.new.invoke(app_config)
  end

  def self.supported?(key)
    app_config_provider.has_config?(key)
  end

  private

  def self.app_config_provider
    @@app_config_provider ||= DashV::AppConfigProvider.new
  end
end
