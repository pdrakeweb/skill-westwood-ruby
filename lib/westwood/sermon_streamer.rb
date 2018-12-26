require 'net/http'
require 'timeout'

module Westwood
  class SermonStreamer
    STREAM_URL = 'https://westwood.unit193.net:8001/westwood'
    STREAM_URL_TEST = 'https://s3.amazonaws.com/ligonier-sermon-media/mp3/20171126_Sproul_A_Great_Salvation.mp3'

    def is_live?(type = :live)
      url = URI.parse(stream_for(type))
      Timeout::timeout(8) do
        return http_success?(url)
      end
    rescue ::Timeout::Error
      false
    end

    def http_success?(url)
      Net::HTTP.start(url.host, url.port, read_timeout: 3, use_ssl: url.scheme == 'https') do |http|
        http.open_timeout = 3
        http.read_timeout = 3
        http.request_get(url.path) do |res|
          return http_success?(URI.parse(res['location'])) if res.is_a?(Net::HTTPRedirection)
          return false unless res.is_a?(Net::HTTPSuccess)
          res.read_body { |chunk| return true }
        end
      end
      true
    rescue ::SocketError
      false
    end

    def stream_for(type = :live)
      case type
      when :live
        STREAM_URL
      when :test
        STREAM_URL_TEST
      else
        raise 'Unknown stream'
      end
    end
  end
end