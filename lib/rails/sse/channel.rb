module Rails
  module SSE
    class Channel
      attr_reader :stream

      def initialize(stream)
        @stream = stream
      end

      def post(message)
        @stream.write(JSON.dump(message) + "\n")
      end

      def ping!
        post('ping')
      end
    end
  end
end
