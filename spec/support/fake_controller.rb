require_relative 'fake_response'

class FakeController
  attr_reader :response

  def initialize
    @response = FakeResponse.new
  end
end
