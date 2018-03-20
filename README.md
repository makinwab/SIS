# Stock Information System

[![Build Status](https://semaphoreci.com/api/v1/makinwa37/sis/branches/master/badge.svg)](https://semaphoreci.com/makinwa37/sis)

## Usage

```ruby
ruby -Ilib bin/console
```

- Create a `.env` file based on `.env_sample`
- Update USER_EMAIL and USER_PASSWORD
- Make email account allow for less secure apps e.g. [Gmail](https://myaccount.google.com/lesssecureapps?rfn=27&rfnc=1&eid=3278497425963345540&et=0&asae=2&pli=1)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/stock_info_system.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
