[![Build Status](https://travis-ci.org/stackbuilders/valid_data.png?branch=master)](https://travis-ci.org/stackbuilders/valid_data)

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

You should expect to see some output like this:

```bash
Model                          | Invalid                        | Total
------------------------------------------------------------------------------------------
MakeNegativeTemplate           | 0                              | 0
KeywordSet                     | 0                              | 1
Placeholder                    | 0                              | 5
User                           | 0                              | 0
Ad                             | 1                              | 1
```

## Contributing

1. Fork it ( https://github.com/mecampbellsoup/valid_data/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
