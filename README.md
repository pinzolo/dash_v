# Dashv

[![Build Status](https://secure.travis-ci.org/pinzolo/dashv.png)](http://travis-ci.org/pinzolo/dashv)
[![Coverage Status](https://coveralls.io/repos/pinzolo/dashv/badge.png)](https://coveralls.io/r/pinzolo/dashv)

Dashv gets version of your applications.

## Installation

Add this line to your application's Gemfile:

    gem 'dashv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dashv

## Usage

```ruby
require 'dashv'

Dashv[:git].version
```

## Applications

Look `config/config.yml` or `spec/apps` directory.

## Supported ruby versions

* 1.9.3
* 2.0.0
* 2.1.2

## Contributing

1. Fork it ( https://github.com/pinzolo/dashv/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
