$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'bundler'
Bundler.require(:default)

require 'lib/invite'

task default: :invitations

task :invitations do
  source = ENV['source'] || 'customers.txt'

  Invite.invitations(source).each { |customer| puts customer.to_json }
end
