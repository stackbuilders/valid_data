module ValidData
  class Runner
    def initialize(padding, adapter)
      @padding = padding.to_i
      @adapter = adapter
      @printer = CliPrinter.new(padding.to_i)
    end

    def data
      models.map do |klass, count = 0|
        next if klass.abstract_class?
        # Count invalid models
        klass.find_each{ |model| count += 1 if model.invalid? }
        #binding.pry if klass.name =~ /Ad\z/
        printer.print(klass, count)
      end
    end

    private

    attr_reader :padding, :adapter, :printer

    def models
      adapter.descendants.reject do |klass|
        klass.name.include?("::Translation")
      end
    end
  end
end
