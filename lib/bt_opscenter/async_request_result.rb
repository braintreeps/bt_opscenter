module BtOpscenter
  class AsyncRequestResult
    def initialize(json_string)
      @result = JSON.parse(json_string)
    end

    def running?
      state == "running"
    end

    def success?
      state == "success"
    end

    def error?
      state == "error"
    end

    def time_taken
      return nil unless time_finished

      time_finished - time_started
    end

    def state
      @result["state"]
    end

    def time_started
      Time.at(@result["started"])
    end

    def time_finished
      Time.at(@result["finished"]) if @result["finished"]
    end
  end
end
