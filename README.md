# sse-rails [![Gem Version](https://badge.fury.io/rb/sse-rails.png)](http://badge.fury.io/rb/sse-rails) [![Build Status](https://travis-ci.org/as-cii/sse-rails.png?branch=master)](https://travis-ci.org/as-cii/sse-rails) [![Code Climate](https://codeclimate.com/github/as-cii/sse-rails.png)](https://codeclimate.com/github/as-cii/sse-rails)
asdasdasdasdasdasdasdasd
ss
asdasd
sad
a
sad

for whatever reason we lost connection so we may be in the wrong spot... 
x
askjdalksjdlkajsdlkajsldkajslkdjaklsdjalksjdlaksjdlkasjdlkajsdlkasjdlakjsaslkdjalksdjlaksjdlkajsldkjaklsjdlaksjdlkasjldkjalskdjkasjdlkajsdjalksjdlaksjdlkasjdklasjdklajsldkjaslkdjalksdjklasjdlkajsdlkajsdlkjasldjalksdjlkasjdlkasjdlkasjdlkajsldkasjdlkasjdkljsdhfkjsdhfkjashdfksjdfhaksjdfhakjsfhaskldjhfalksjdhfalksdjfhaslkdjfhaskldjfhaslkdjfhaslkdjfhaslkdjfhasdlkjfhasdlkjfhasdlkfjhasdflkjahsdflkjahsdfkljahsdfkjashdkfjhaskdjfhakjsdhfnkxcbvkzxcbvkjzxhgcvkjashdfkashdfkjashdfahsdufiasydfjhasdkjhvaskjdhfajsdhfjaklsdfasd
asdasdasdwersadfsdfsdfsdfsdfvsdfserwerwerwerwerwerwerwe


asjdlkasjdklajsdlkjaslkdjalksjflksdajfiquweriowejlksdjflskdjf jdfkjsdkfjiau iauksjdfjks dfiueiruwkjsjksdfkjs ldkfjslk djfsidufslkdjflskdfjoiweur lkdjflj dfljsdfiuweioruw ldkjfslkdj f



sadsdasdasdasdasdasdasdasdasdasd



asdasdasd

sdasdasdsddfsdlf;sdkglksfg sdf sdf sdf sdf sdf


dfsdf

asdasd

e-rails is a simple wrapasdasdasdasdasdper around ActionController::Live to hide all the complexity of streaming.asdasdasdasdasd
asdasdasdasdasddsczxvdaasdasdasasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd
## Installation
rrrr
Add this line to your application's Gemfile:
ggggg
```ruby
gem 'sse-rails'
```
asdasdasdasdasdasdasdasd
And then execute:
asdasdasdasdasdasdasdasdasdasdasdasdasdasd
asdasdasdasdasdasdasdasdasdasdasdasdasdasd
iwuetiwyeiuweyriuweyriwueyriuwyeriuwyeiruw
aosdasdals;doqiweoqiweroflsdfvskldfsdvxc
woeiroweirsldfs 
defs defs
d featuresd
f seedf
seedfdfwer;owieoriw eorw erwer
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
require 'rails/sse'

include ActionController::Live
include Rails::SSE
```

And then use it in one of your actions:

```ruby
def listen
  stream do |channel|
    channel.post({ username: 'jim' }, event: 'refresh')
  end
end
```

You can also use `Rails::SSE::Channel#ping!` to see if connection is still open. This is useful when you are in a loop like this:

```ruby
def listen
  stream do |channel|
    loop do
      channel.post('anything') if condition

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
