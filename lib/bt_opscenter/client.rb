require "faraday"
require "json"
require "uri"

module BtOpscenter
  class Client
    attr_reader :host, :port

    def initialize(host, port)
      @host, @port = host, port
    end

    def get_backups(cluster_id)
      resp = get "/#{cluster_id}/backups"
      JSON.parse(resp).map do |key, value|
        Backup.new(name: key, keyspaces: value["keyspaces"].keys, created_at: Time.at(value["time"]))
      end
    end

    def restore_backup(cluster_id, backup_tag, options = {})
      path = [
        cluster_id, 'backups', 'restore', backup_tag, options[:ksname]
      ].compact.join("/")

      post(path).delete('"')
    end

    def get_request_status(request_id)
      AsyncRequestResult.new(get("/request/#{request_id}/status"))
    end

    private

    [:get, :post].each do |verb|
      define_method(verb) do |path|
        begin
          url = URI.join("http://#{host}:#{port}", path)
          http = Faraday.new(:url => url)
          resp = http.send(verb, url)

          unless resp.success?
            raise InvalidAPIResponse.new(verb, url, resp)
          end

          resp.body
        rescue Faraday::ConnectionFailed
          raise InvalidAPIEndpoint.new(host, port)
        end
      end
    end
  end
end
