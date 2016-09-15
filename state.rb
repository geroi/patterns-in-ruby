#Framework для State - gem state_machine

# состояния лучше описаны в книге Эрика и Элизабет Фримен "Паттерны проектирования"
# Суть такова, что имеется автомат по продаже жевачки.
# Когда бросаешь монетку, поведение зависит от состояния.
# Интерфейсы общие для всех состояний. 
# Действия, специфичные для состояний, инкапсулирвоаны внутр состояний
# Переходы между состояниями реализованы внутри состояний

class TCPConnection
  include Forwardable
  attr_delegators :@state, :connect, :send, :disconnect
  def initialize
    @state = TCPState.new(self).current_state
  end

  def current_state
    @state
  end

  def establish_connection
  end
end

class TCPState
  def initialize connection
    @connection = connection
    @states = [TCPOpen.new @connection, TCPClosed.new @connection]
  end

  def current_state
    @states[0]
  end

  def next_state
    @states.rotate! 1
  end
end

class TCPOpen < TCPState
  def connect
  end
  def send
    @connection.send_data
  end
  def disconnect
    next_state
  end
end

class TCPClosed < TCPState
  def connect
    @connection.establish
    next_state
  end
  def send
    raise ConnectionClosedError
  end
  def disconnect
    
  end
end