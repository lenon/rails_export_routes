# rails-export-routes

This is a small gem that allows you to export Rails routes to CSV or JSON.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_export_routes'
```

And then execute:

    $ bundle install

## Usage

To export Routes to CSV:

```bash
bundle exec rails-export-routes export my-app-routes.csv
```

When JSON is the preferred format:

```bash
bundle exec rails-export-routes export --format json my-app-routes.json
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lenon/rails_export_routes.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
