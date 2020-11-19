module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    attr_reader :instances

    def counter
      @instances ||= 0
      @instances += 1
    end
  end

  module InstanceMethods
    def register_instance
      self.class.counter
    end
  end
end
