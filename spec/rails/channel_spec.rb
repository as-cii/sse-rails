require 'minitest/autorun'
require 'rails/sse/channel'
require 'stringio'
require 'json'

describe Rails::SSE::Channel do
  before(:each) do
    @input, @output = IO.pipe
    @channel = Rails::SSE::Channel.new(@output)
  end

  it 'sends hash messages in json' do
    message = { event: 'test', text: 'A message' }
    @channel.post(message)

    @input.gets.must_include("#{JSON.dump(message)}")
  end

  it 'sends plain messages as strings' do
    message = 'Plain message'
    @channel.post(message)

    @input.gets.must_include(message)
  end

  it 'pings client for keep–alive' do
    @channel.ping!

    @input.gets.must_include('ping')
  end
end
