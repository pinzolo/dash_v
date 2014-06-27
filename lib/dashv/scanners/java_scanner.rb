module Dashv::Scanners
  class JavaScanner
    PATTERN = /\A.*(?<major>\d+)\.(?<minor>\d+)\.(?<tiny>\d+)\_(?<patch>\d+).*\z/.freeze

    def scan(text)
      match_data = PATTERN.match(text.split("\n").first)
      { major: match_data[:major], minor: match_data[:minor], tiny: match_data[:tiny], patch: match_data[:patch] } if match_data
    end
  end
end

