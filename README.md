# TODO

* Add ParallelRunner, making use of Thread and Queue
* Re-introduce `puts` to STDOUT (it's gone right now...)
* Add `rake notes` task like Rails has to find pending `TODO`s in code

## Installation

Add this line to your application's Gemfile:

    gem 'valid_data'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install valid_data

## Usage

Invoke the `Rake Task` that is now at your fingertips:

```bash
rake validate_records[30]
```
... where the `30` refers to the amount of extra padding in the printed output.

## Contributing

1. Fork it ( https://github.com/mecampbellsoup/valid_data/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
