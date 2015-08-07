# Relativize

Relativize is a simple way to ensure that you redirect to a string URL
which is relative to your application and doesn't lead you to external
domains.

It's meant to be used alongside Rails' `redirect_to`, sinatra's `redirect`
or any other redirection mechanism.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'relativize'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install relativize

## Usage

Relativize is a PORO that should be initialized with a URL and
optionally a `default_url` to be returned in case of exceptions.

    Relativize.new('https://example.com/path?query=yeap').call
    # => /path?query=yeap

    Relativize.new('/path?query=yeap').call
    # => /path?query=yeap

    Relativize.new('%invalid uri%', default_url: '/home').call
    # => /home

    Relativize.new('%invalid uri%').call
    # => /

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/relativize. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

