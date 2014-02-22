module Rails
  module SSE
    class Channel
      attr_reader :stream

      def initialize(stream)
        @stream = stream
      end

      def post(data, options = {})
        raise ArgumentError unless data

        options.each do |key, value|
          @stream.write("#{key}: #{value}\n")
        end

        @stream.write("data: #{JSON.dump(data)}\n\n")
      end

      def ping!
        post(:ping)
      end
    end
  end
end
