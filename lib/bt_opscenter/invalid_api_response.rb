module BtOpscenter
  class InvalidAPIResponse < StandardError
    attr_reader :verb, :url, :response

    def initialize(verb, url, response)
      @verb = verb
      @url = url
      @response = response
    end

    def to_s
      message = JSON.parse(response.body)["message"]
      "Invalid #{verb.upcase} request made to #{url}, got: #{message}"
    end
  end
end
