module ValidData
  class Printer
    def initialize(padding)
      @padding = padding
      print_header
    end

    def print(result)
      # Format result
      puts "%s | %s | %s" % [result.name, result.invalid_count, result.total].map{ |cell| cell.to_s.ljust(padding) }
    end

    private

    def print_header
      # Header
      puts "%s | %s | %s" % ["Model", "Invalid", "Total"].map{ |s| s.ljust(padding) }
      puts "-" * 3 * padding
    end

    attr_reader :result, :padding
  end
end
