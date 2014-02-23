require 'minitest/autorun'
require 'rails/sse/channel'
require 'json'
require 'stringio'
require 'support/matchers'

describe Rails::SSE::Channel do
  before(:each) do
    @input = StringIO.new
    @channel = Rails::SSE::Channel.new(@input)
  end

  it 'encodes data in json' do
    data = { 'test' => 1 }

    @channel.post(data)
    response = @input.string.match(/data: (.+)\n/)

    JSON.parse(response[1]).must_equal(data)
  end

  it 'encodes options in kv format' do
    options = { event: 'refresh', id: 'test' }
    @channel.post({}, options)

    @input.string.must_match(/event: refresh\n/)
    @input.string.must_match(/id: test\n/)
  end

  it 'pings client for keep–alive' do
    @channel.ping!

    @input.string.must_match(/data: (.+)\n/)
  end

  it 'closes a data-only message with two LF' do
    @channel.post({ test: 'data' })

    assert_line_endings
  end

  it 'closes a options-only message with two LF' do
    @channel.post(nil, event: 'test')

    assert_line_endings
  end

  it 'does not include data option when data is empty' do
    @channel.post(nil, event: 'test')

    @input.string.wont_match(/data: .*/)
  end

  it 'raises an error when data and options are both nil or empty' do
    lambda { @channel.post(nil, nil) }.must_raise(ArgumentError)
    lambda { @channel.post({}, nil) }.must_raise(ArgumentError)
    lambda { @channel.post(nil, {}) }.must_raise(ArgumentError)
  end
end
