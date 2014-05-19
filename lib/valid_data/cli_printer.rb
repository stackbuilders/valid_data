module ValidData
  class CliPrinter
    def initialize(padding)
      @padding = padding
      # Header
      puts "%s | %s | %s" % ["Model", "Invalid", "Total"].map{|s| s.ljust(padding) }
      puts "-" * 3 * padding
    end

    def print(klass, count)
      # Format result
      puts "%s | %s | %s" % [klass.name, count, klass.count].map{ |cell| cell.to_s.ljust(padding) }
    end

    private

    attr_reader :klass, :count, :padding
  end
end
