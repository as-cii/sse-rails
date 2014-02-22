require "rails/sse/version"
require "rails/sse/channel"

module Rails
  module SSE
    def channel
      Channel.new(response.stream)
    end

    def stream
      response.headers['Content-Type'] = 'text/event-stream'

      begin
        yield(channel) if block_given?
      rescue IOError
      ensure
        response.stream.close unless response.stream.closed?
      end
    end

  end
end
