require 'singleton'

class Simple
  include Singleton # делает из объекта синглтон - единственный объект этого класса в памяти

  def hello
    puts 'hello world'
  end
end

singleton_object = Singleton.instance # :singleton_object
new_singleton_object = Singleton.new # ERROR 