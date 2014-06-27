module Dashv::Scanners
  class PerlScanner
    VERSION_PATTERN = /\A.+\(v(?<major>\d+)\.(?<minor>\d+)\.(?<tiny>\d+)\).*\z/.freeze
    PATCH_PATTERN = /\A\(with (?<patch>\d+) registered patches.*\z/.freeze

    def scan(text)
      version_data, patch_data = scan_text(text)
      create_data(version_data, patch_data)
    end

    private
    def scan_text(text)
      lines = text.split("\n").reject { |line| line.strip.empty? }
      version_data = VERSION_PATTERN.match(lines.first) if lines
      patch_data = PATCH_PATTERN.match(lines[1]) if lines.size > 1
      [version_data, patch_data]
    end

    def create_data(version_data, patch_data)
      return unless version_data
      { major: version_data[:major], minor: version_data[:minor], tiny: version_data[:tiny] }.tap do |data|
        data.merge!(patch: patch_data[:patch]) if patch_data
      end
    end
  end
end


