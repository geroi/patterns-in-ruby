require 'observer'
class User
  attr_accessor :name, :last_name, :age
  include Observable
  def initialize name, last_name, age
    @name, @last_name, @age = name, last_name, age
    @options = {}
  end

  def update options={}
    options.each{|key,value|
      self.send("#{key}=".to_sym, value) if self.respond_to? key
    }
    
    changed # изменение состояния
    notify_observers(self,options) # оповещение наблюдателей
  end
end

class BaseObserver
  def initialize
  end
end

class NameObserver < BaseObserver 
  def update observable, options
    puts "Name has changed" if options[:name]
  end
end


class LastNameObserver < BaseObserver 
  def update observable, options
    puts "Last name changed" if options[:last_name]
  end
end

user = User.new('Ivan', 'Petrov', 21)
user.add_observer(NameObserver.new)
user.add_observer(LastNameObserver.new)
user.update name: 'Alexander', age: 22