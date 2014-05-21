module ValidData
  class Printer
    #TODO: Auto-scale padding as a function of the longest name being printed.
    def initialize(padding)
      @padding = padding
      puts header
    end

    def print(result)
      "%##{padding}{name} | %##{padding}{invalid_count} | %##{padding}{total}" % result.to_h
    end

    def header
      "%s | %s | %s" % ["Model", "Invalid", "Total"].map{ |s| s.rjust(padding) } +
      "\n" + "-" * 3 * padding
    end

    private

    attr_reader :result, :padding
  end
end
