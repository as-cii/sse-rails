module Rails
  module SSE
    class Channel
      attr_reader :stream

      def initialize(stream)
        @stream = stream
      end

      def post(data, options = {})
        raise ArgumentError if empty_arg?(data) && empty_arg?(options)

        options.each do |key, value|
          @stream.write("#{key}: #{value}\n")
        end

        @stream.write("data: #{JSON.dump(data)}\n") unless empty_arg?(data)
        end_message
      end

      def ping!
        post(:ping)
      end

      private
      def end_message
        @stream.write("\n")
      end

      def empty_arg?(argument)
        !argument || argument.empty?
      end
    end
  end
end
