# ❨╯°□°❩╯︵┻━┻

You know when you accidentally do a stupid thing like running tests against a
database with data in it and you loose the data because your test suite cleans
the database before running? Table flip lets you safeguard against that if
you're using [Sequel](http://sequel.jeremyevans.net/) as your ORM.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "table-flip"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install table-flip

## Usage

```ruby
# spec/spec_helper.rb
require "table-flip"

RSpec.configure do |config|
  # ...
  TableFlip.new(Sequel::Model.db).check!
  # ...
end
```

This will raise a `TableFlip::DBNotEmptyError` if the database contains any
records. If you really really really want to wipe it anyway, you can run your
command with an easy to remember environment variable:

```bash
WIPE_DB_YES_I_REALLY_REALLY_KNOW_WHAT_IM_DOING=true rspec
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/table-flip/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
