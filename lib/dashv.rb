require 'dashv/gem_version'
require 'dashv/version'
require 'dashv/invoker'
require 'dashv/app_config_provider'

module Dashv
  def self.[](key)
    app_config = app_config_provider.get(key)
    Dashv::Invoker.new.invoke(app_config)
  end

  def self.supported?(key)
    app_config_provider.has_config?(key)
  end

  private

  def self.app_config_provider
    @@app_config_provider ||= Dashv::AppConfigProvider.new
  end
end
