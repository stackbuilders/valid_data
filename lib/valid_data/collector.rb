module ValidData
  class Collector
    def initialize(models)
      @models = models
    end

    def each(&block)
      return enum_for(:each) unless block_given?

      models.each { |model|
        yield compute_result(model)
      }
    end

    def compute_result(model)
      invalid_count, total = 0, 0

      model.find_each do |m|
        invalid_count += 1 if m.invalid?
        total += 1
      end

      Result.new(model.name, invalid_count, total)
      #NOTE: The following line doesn't work for Rails < 4.0!
      #Result.new(model.name, model.find_each.select(&:valid?), model.count)
    end

    private

    attr_reader :models
  end
end
