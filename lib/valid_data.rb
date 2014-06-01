require "valid_data/version"
require "valid_data/runner"
require "valid_data/parallel_runner"
require "valid_data/printer"
require "valid_data/collector"

module ValidData
  require 'valid_data/railtie' if defined?(Rails)

  # Result serves as a data structure between Runner and Printer
  Result = Struct.new(:name, :invalid_count, :total)
end
