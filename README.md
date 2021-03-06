# Blink1Rspec3Formatter

[![Build Status](https://travis-ci.org/yoichiro-manabe/blink1_rspec3_formatter.svg?branch=master)](https://travis-ci.org/yoichiro-manabe/blink1_rspec3_formatter)

[![Code Climate](https://codeclimate.com/github/yoichiro-manabe/blink1_rspec3_formatter/badges/gpa.svg)](https://codeclimate.com/github/yoichiro-manabe/blink1_rspec3_formatter)

[![Gem Version](https://badge.fury.io/rb/blink1_rspec3_formatter.svg)](https://badge.fury.io/rb/blink1_rspec3_formatter)

This enables indicating **RSpec 3** status with blink(1). When executing rspec3 is below code, blink(1) is blink for rspec result.

```ruby
rspec --format Blink1Rspec3Formatter --format document
```

blink(1) bright pattern:

* rspec result is success => RGB(  0, 255, 35)
* rspec result is pending => RGB(255, 200,  0) and blink pending count.
* rspec result is success => RGB(255,  10, 30) and blink error example count.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'blink1_rspec3_formatter'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install blink1_rspec3_formatter

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yoichiro_manabe/blink1_rspec3_formatter.

