require 'json'

module Invite
  class Parser
    attr_reader :filename

    def initialize(filename)
      raise "Can't locate source file: #{filename}." unless File.exist?(filename)

      @filename = filename
    end

    def customers
      items.map { |item| Customer.new(item) }
    end

    private

    def items
      lines.map { |line| JSON.parse!(line) }
    end

    def lines
      File.open(filename).readlines.map(&:chomp)
    end
  end
end
