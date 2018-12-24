require "net/http"

module Westwood
  class SermonStreamer
    STREAM_URL = 'https://westwood.unit193.net:8001/westwood'

    def is_live?
      url = URI.parse(STREAM_URL)
      Timeout::timeout(8) do
        http_success?(url)
      end
      false
    rescue Timeout::Error
      false
    end

    def http_success?(url)
      Net::HTTP.start(url.host, url.port, read_timeout: 3, use_ssl: url.scheme == 'https') do |http|
        http.open_timeout = 3
        http.read_timeout = 3
        http.request_get(url.path) do |res|
          return false unless res.is_a?(Net::HTTPSuccess)
          res.read_body { |chunk| return true }
        end
      end
      false
    rescue SocketError
      false
    end
  end
end