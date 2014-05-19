module ValidData
  class Validity
    def initialize(instance)
      @instance = instance
    end

    def valid?
      instance.valid?
    end
  end
end
