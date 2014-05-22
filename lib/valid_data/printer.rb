module ValidData
  class Printer
    #TODO: Auto-scale padding as a function of the longest name being printed.
    def initialize(padding)
      @padding = padding
      puts header
    end

    def print(result)
      "%s | %s | %s" % [result.name, result.invalid_count, result.total].map{ |cell| cell.to_s.ljust(padding) }
    end

    def header
      "%s | %s | %s" % ["Model", "Invalid", "Total"].map{ |title| title.ljust(padding) } +
      "\n" + "-" * 3 * padding
    end

    private

    attr_reader :result, :padding
  end
end
