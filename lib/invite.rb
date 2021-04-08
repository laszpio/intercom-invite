$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'bundler/setup'
Bundler.require

require 'invite/customer'
require 'invite/distance'
require 'invite/parser'
require 'invite/location'

module Invite
  DEFAULT_SOURCE = 'customers.txt'
  PARTY_LOCATION = Location.new('53.339428', '-6.257664')
  MAX_DISTANCE = 100 # in kilometres

  def self.invitations(filename)
    Parser.new(filename).customers.select do |customer|
      customer.in_range?(MAX_DISTANCE, PARTY_LOCATION)
    end.sort_by(&:user_id)
  end
end
