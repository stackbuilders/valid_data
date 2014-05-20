module ValidData
  class Runner
    # Result serves as a shim (shim, yea?) between Runner and Printer
    Result = Struct.new(:name, :invalid_count, :total)

    def initialize(padding, adapter)
      @padding = padding.to_i
      @adapter = adapter
      @printer = Printer.new(padding.to_i)
    end

    def data
      models.map do |klass, count = 0|
        # Skip models without tables backing them
        next if klass.abstract_class?
        # For each class, find & count invalid rows in the DB
        klass.find_each{ |model| count += 1 if Validity.new(model).valid? }
        # Instantiate a Result instance to remove Printer dependency
        result = Result.new(klass.name, count, klass.count)
        printer.print(result)
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
