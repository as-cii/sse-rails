# sse-rails

sse-rails is a simple wrapper around ActionController::Live to hide all the complexity of streaming.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sse-rails'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install sse-rails
```

## Usage

Add these lines to a controller:

```ruby
include ActionController::Live
include Rails::SSE
```

And then use it in one of your actions:

```ruby
def listen
  stream do |channel|
    channel.post(event: 'refresh')
  end
end
```

You can also use `Rails::SSE::Channel#ping!` to see if connection is still open. This is useful when you are in a loop like this:

```ruby
    def listen
      stream do |channel|
        loop do
          channel.send('something') if condition

          channel.ping!
          sleep 1
        end
      end
    end
```

Without pinging you would know that the connection was lost only when the condition becomes true.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
