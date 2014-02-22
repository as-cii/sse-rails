class FakeResponse
  attr_reader :headers, :stream

  def initialize
    @headers = Hash.new
    @stream = File.open('/dev/null')
  end
end
