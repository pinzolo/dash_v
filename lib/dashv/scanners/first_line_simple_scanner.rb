module Dashv::Scanners
  class FirstLineSimpleScanner
    PATTERN = /\A.+(?<major>\d+)\.(?<minor>\d+)\.(?<tiny>\d+).*\z/.freeze

    def scan(text)
      match_data = PATTERN.match(text.split("\n").find { |line| !line.strip.empty? })
      { major: match_data[:major], minor: match_data[:minor], tiny: match_data[:tiny] } if match_data
    end
  end
end

