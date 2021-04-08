module Invite
  class Location
    PI_OVER_180 = Math::PI / 180.0

    attr_reader :latitude, :longitude

    def initialize(latitude, longitude)
      @latitude = Float(latitude)
      @longitude = Float(longitude)
    end

    def degrees
      [latitude, longitude]
    end

    def radians
      @radians ||= degrees.map { |deg| deg * PI_OVER_180 }
    end
  end
end
