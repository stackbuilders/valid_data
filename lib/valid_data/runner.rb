module ValidData
  class Runner
    def initialize(padding, adapter)
      @padding = padding.to_i
      @adapter = adapter
      @printer = Printer.new(padding.to_i)
    end

    def run
      collector.each { |result|
        puts printer.print(result)
      }
    end

    private

    attr_reader :padding, :adapter, :printer

    def collector
      @collector ||= Collector.new(models)
    end

    def models
      adapter.descendants.reject do |klass|
        klass.name.include?("::Translation") || klass.abstract_class?
      end
    end
  end
end
