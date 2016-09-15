class ConcreteButton
  def initialize options
    @name = options[:name]
    @action = options[:action]
  end

  def click
    @action.execute
  end
end

class Command
  def execute
    puts "Executed"
  end
end
button = ConcreteButton.new(name: 'button1', action: Command.new)
button.click