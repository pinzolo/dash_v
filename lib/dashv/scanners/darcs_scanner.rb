module Dashv::Scanners
  class DarcsScanner
    PATTERN = /\A(?<major>\d+)\.(?<minor>\d+)\.(?<tiny>\d+)\s\((release|\+\s(?<patch>\d+) patch)\)\z/.freeze

    def scan(text)
      match_data = PATTERN.match(text)
      { major: match_data[:major], minor: match_data[:minor], tiny: match_data[:tiny], patch: match_data[:patch] } if match_data
    end
  end
end


