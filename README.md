# local_dump

Rake tasks for Dump and Restore PostgreSQL database in Rails (based on pg_dump/pg_restore)

## Installation

Add this line to your application's Gemfile and then execute `bundle install`

```ruby
gem 'local_dump'
```

## Usage

Dump the database, which will be created in `db/dump/` with name `db-app-name_my-dump-name.psql`

```ruby
bundle exec rake local:db:dump'[my-dump-name]'
```

Restore the database dump

```ruby
bundle exec rake local:db:restore'[my-dump-name]'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kirillshevch/local_dump.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
