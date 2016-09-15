class Simple
  class << self # Определение метода класса
    def hello
      puts 'hello'
    end
  end

  def self.class_method # Определение метода класса
    puts "I am a class method"
  end
end

Simple.class_method # I am a class method
Simple.hello # hello
object = Simple.new
object.hello # ошибка - нет такого метода

