module Dashv::Scanners
  class BazaarScanner
    PATTERN = /\ABazaar\s\(bzr\)\s(?<major>\d+)\.(?<minor>\d+)\.(?<tiny>\d+)(dev(?<patch>\d+))?\z/.freeze

    def scan(text)
      match_data = PATTERN.match(text.split("\n").first.strip)
      { major: match_data[:major], minor: match_data[:minor], tiny: match_data[:tiny], patch: match_data[:patch] } if match_data
    end
  end
end

