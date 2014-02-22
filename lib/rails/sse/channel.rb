module Rails
  module SSE
    class ConnectionLost < StandardError
    end

    class Channel
      attr_reader :stream

      def initialize(stream)
        @stream = stream
      end

      def post(message)
        begin
          @stream.write(JSON.dump(message) + "\n")
        rescue IOError
          raise ConnectionLost
        end
      end

      def ping!
        post('ping')
      end
    end
  end
end
