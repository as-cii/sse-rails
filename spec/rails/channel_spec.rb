require 'minitest/autorun'
require 'rails/sse/channel'
require 'json'

describe Rails::SSE::Channel do
  before(:each) do
    @input, @output = IO.pipe
    @channel = Rails::SSE::Channel.new(@output)
  end

  it 'encodes data in json' do
    data = { 'test' => 1 }

    @channel.post(data)
    response = @input.gets.match(/data: (.+)/)

    JSON.parse(response[1]).must_equal(data)
  end

  it 'encodes options in kv format' do
    options = { event: 'refresh', id: 'test' }
    @channel.post({}, options)

    @input.gets.must_match(/event: refresh/)
    @input.gets.must_match(/id: test/)
  end

  it 'pings client for keep–alive' do
    @channel.ping!

    @input.gets.must_match(/data: (.+)/)
  end

  it 'closes the message with two LF' do
    @channel.post({})

    @input.gets.wont_be_nil
    @input.gets.wont_be_nil
  end

  it 'raises an error when data is nil' do
    lambda { @channel.post(nil) }.must_raise(ArgumentError)
  end
end
