module Invite
  class Distance
    EARTH_RADIUS_KM = 6371.0

    def initialize(location_a, location_b)
      @lat_a, @lng_a = location_a.radians
      @lat_b, @lng_b = location_b.radians
    end

    def self.distance(location_a, location_b)
      new(location_a, location_b).distance
    end

    def distance
      2 * archaversine * EARTH_RADIUS_KM
    end

    private

    def archaversine
      Math.atan2(Math.sqrt(delta), Math.sqrt(1 - delta))
    end

    def delta
      Math.sin(delta_lat / 2)**2 +
        Math.cos(@lat_a) *
        Math.cos(@lat_b) *
        Math.sin(delta_lng / 2)**2
    end

    def delta_lat
      @lat_a - @lat_b
    end

    def delta_lng
      @lng_a - @lng_b
    end
  end
end
