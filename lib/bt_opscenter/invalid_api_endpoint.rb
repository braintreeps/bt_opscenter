module BtOpscenter
  class InvalidAPIEndpoint < StandardError
    attr_reader :endpoint

    def initialize(host, port)
      @endpoint = "http://#{host}:#{port}"
    end

    def to_s
      "Could not connect to API endpoint #{endpoint}"
    end
  end
end
