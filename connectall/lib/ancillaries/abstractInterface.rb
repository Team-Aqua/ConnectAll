module AbstractInterface

  ##
  # Framework for abstract interface 
  # Code referenced from: http://metabates.com/2011/02/07/building-interfaces-and-abstract-classes-in-ruby/

  class InterfaceNotImplementedError < NoMethodError
  end

  def self.included(klass)
    klass.send(:include, AbstractInterface::Methods)
    klass.send(:extend, AbstractInterface::Methods)
    klass.send(:extend, AbstractInterface::ClassMethods)
  end

  module Methods

    def api_not_implemented(klass, method_name = nil)
      if method_name.nil?
        caller.first.match(/in \`(.+)\'/)
        method_name = $1
      end
      raise AbstractInterface::InterfaceNotImplementedError.new("#{klass.class.name} needs to implement '#{method_name}' for interface #{self.name}!")
    end

  end

  module ClassMethods

    def needs_implementation(name, *args)
      self.class_eval do
        define_method(name) do |*args|
          self.api_not_implemented(self, name)
        end
      end
    end

  end

end

# HOW TO IMPLEMENT
# class Model
#   include AbstractInterface
  
#   needs_implementation :addObserver, :observer
#   needs_implementation :notifyObservers
#   needs_implementation :update

#   @observers = []
#   def add_observer(observer)
#     self.api_not_implemented(self)
#   end
# end