require "valid_data/version"
require "valid_data/validity"
require "valid_data/runner"
require "valid_data/cli_printer"

module ValidData
  require 'valid_data/railtie' if defined?(Rails)
end
