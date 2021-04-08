module Invite
  class Customer
    attr_reader :user_id, :name, :location

    def initialize(args)
      @user_id = args['user_id']
      @name = args['name']
      @location = Location.new(args['latitude'], args['longitude'])
    end

    def in_range?(max_distance, remote_location)
      distance_from(remote_location) <= max_distance
    end

    def distance_from(remote_location)
      Distance.distance(remote_location, location)
    end

    def to_h
      { user_id: user_id, name: name }
    end

    def to_json(*_args)
      to_h.to_json
    end
  end
end
