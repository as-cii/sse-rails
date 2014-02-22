require 'minitest/autorun'
require 'support/fake_controller'
require 'rails/sse'

describe Rails::SSE do
  before(:each) do
    @controller = FakeController.new
    @controller.extend(Rails::SSE)
  end

  it 'sets content-type to text/event-stream' do
    @controller.stream

    content_type = @controller.response.headers['Content-Type']
    content_type.must_equal('text/event-stream')
  end

  it 'closes event stream before ending communication' do
    @controller.stream

    @controller.response.stream.closed?.must_equal(true)
  end

  it 'closes event stream when errors are raised' do
    @controller.stream do |channel|
      raise IOError
    end

    @controller.response.stream.closed?.must_equal(true)
  end

  it 'streams messages to the channel' do
    channel = MiniTest::Mock.new
    channel.expect(:ping!, nil)
    channel.expect(:send, nil, ['p1', 'p2'])

    @controller.stub(:channel, channel) do
      @controller.stream do |channel|
        channel.ping!
        channel.send('p1', 'p2')
      end

      channel.verify
    end
  end

  it 'has a default channel' do
    @controller.channel.must_be_instance_of(Rails::SSE::Channel)
    @controller.channel.stream.must_equal @controller.response.stream
  end
end
