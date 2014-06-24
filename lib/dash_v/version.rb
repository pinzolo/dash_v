require 'dash_v/scanners/default_scanner'
require 'dash_v/scanners/simple_scanner'

module DashV
  class Version
    include Comparable

    attr_reader :major, :minor, :tiny, :patch
    alias_method :build, :patch

    def initialize(major, minor = nil, tiny = nil, patch = nil)
      if major.is_a?(Integer)
        deploy(major: major, minor: minor, tiny: tiny, patch: patch)
      elsif major.is_a?(String)
        scanner = DashV::Scanners::DefaultScanner.new
        deploy(scanner.scan(major))
      elsif major.is_a?(Hash)
        deploy(major)
      else
        deploy({})
      end
    end

    def simple
      "#{@major}.#{@minor}.#{@tiny}"
    end

    def default
      "#{simple}p#{@patch}"
    end

    def to_s
      default
    end

    def <=>(other)
      value = other.is_a?(DashV::Version) ? other : DashV::Version.new(other.to_s)
      if major == value.major
        if minor == value.minor
          tiny == value.tiny ? patch <=> value.patch : tiny <=> value.tiny
        else
          minor <=> value.minor
        end
      else
        major <=> value.major
      end
    end

    def tilde_greater_than?(version)
      scanner = DashV::Scanners::SimpleScanner.new
      version_data = scanner.scan(version.to_s)
      if version_data.nil?
        false
      else
        if version_data[:tiny]
          major == version_data[:major].to_i && minor == version_data[:minor].to_i && tiny >= version_data[:tiny].to_i
        elsif version_data[:minor]
          major == version_data[:major].to_i && minor >= version_data[:minor].to_i
        else
          major >= version_data[:major].to_i
        end
      end
    end
    alias_method :tgt?, :tilde_greater_than?

    private

    def deploy(values)
      vals = values || {}
      @major = vals[:major].to_i
      @minor = vals[:minor].to_i
      @tiny  = vals[:tiny].to_i
      @patch = vals[:patch].to_i
    end
  end
end
