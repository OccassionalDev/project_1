# BassTournaments

This gem scrapes data of bassmaster tournaments and allows the user to see a list tournaments that are availble for the year, even if they passed. Once in the list, the user may select any tournament from the list given and may more information about the tournament they selected, the information being the name, series, dates, and location of the tournament.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bass_tournaments'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bass_tournaments

## Usage

To start the list up to add in to a application, add CLI.new.start to load up CLI menu. This menu wil allow the user to do the following:

  - Open and view the list of all tournaments for the year
  - Get more information about the selected tournament 
  - Exit the program at any time during use 

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'eschimmel'/bass_tournaments. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BassTournaments project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'eschimmel'/bass_tournaments/blob/master/CODE_OF_CONDUCT.md).
