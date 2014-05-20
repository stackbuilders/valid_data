module ValidData
  class Validity
    def initialize(instance)
      @instance = instance
    end

    def valid?
      instance.valid?
    end

    private

    attr_reader :instance
  end
end
