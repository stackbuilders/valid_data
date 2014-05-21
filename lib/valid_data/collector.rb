module ValidData
  class Collector
    def initialize(models)
      @models = models
    end

    def each(&block)
      return enum_for(:each) unless block_given?

      models.each { |model|
        result = compute_result(model)
        yield result
      }
    end

    def compute_result(model)
      #NOTE: The following doesn't work for Rails < 4.0!
      #Result.new(model.name, model.find_each.select(&:valid?), model.count)
      invalid_count = 0
      model.find_each do |m|
        invalid_count += 1 if m.invalid?
      end
      Result.new(model.name, invalid_count, model.count)
    end

    private

    attr_reader :models
  end
end
