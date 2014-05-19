# TODO

* Define a Raketask in OOP way
* The executable should add that Raketask to the project's available Raketasks
* Rakefile should end up with a single task that invokes desired behavior
  * e.g. `ValidData.new.validate`
  * With that, write to the `bin` file to simply run that Raketask inside the project the gem is being bundled into

## Installation

Add this line to your application's Gemfile:

    gem 'valid_data'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install valid_data

## Usage

1. Add `ValidData` to your project's `Gemfile`:

```ruby
gem 'valid_data'
```
2. Invoke the `Raketask` that is now at your fingertips:

```bash
rake valid_data:db:data:check
```

## Contributing

1. Fork it ( https://github.com/mecampbellsoup/valid_data/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
