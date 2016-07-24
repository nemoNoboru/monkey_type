module MonkeyType

  refine Class do
    def contract(method, type)
      alias_method "#{method}_typeless" , "#{method}"

      define_method "#{method}" do |*args|
        returned = send("#{method}_typeless",*args)
        unless returned.is_duck? type
          raise TypeError, "returned value #{returned} is not #{type}"
        end
        returned
      end
    end
  end

  refine Object do
    def is (type)
      unless is_duck? type
        raise TypeError, "error: #{self.class} is not an #{type}"
      end
    end

    def is_duck?(type)

      if type.is_a? Option
        if self == nil then return true end
        type = type.get_type
      end

      if type.is_a? Boolean
        return self == true || self == false
      end

      if self.is_a? type then return true end

      self_methods = self.methods
      type.instance_methods.each do |method|
        unless self_methods.include? method
          return false
        end
      end

      return true
    end
  end

  refine Object do
    def option(type)
      MonkeyType::Option.new(type)
    end

    def boolean
      MonkeyType::Boolean.new
    end
  end

  class Option
    def initialize(type)
      @type = type
    end

    def get_type
      @type
    end
  end

  class Boolean
  end

end
