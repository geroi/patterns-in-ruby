class RequestHandler
  def self.handle_request request
    self.new.handle_request request
  end

  def handle_request request
    @handlers = [
      SpamHandler.new(self),
      ComplaintHandler.new(self),
      NewLocationHandler.new(self),
      DefaultHandler.new(self)
    ]
    @handlers.reverse!
    @handlers.last.handle_request request
  end

  def next
    @handlers.pop
    current_handler.handle_request @request
  end

  def current_handler
    @handlers[0]
  end
end

class BaseHandler
  def initialize main_handler
    @main = main_handler
  end
end

class SpamHandler < BaseHandler
  def handle_request request
    if request == 'spam'
      return "It's a spam"
    else
      @main.next
    end 
  end
end

class ComplaintHandler < BaseHandler
  def handle_request request
    if request == 'complaint'
      return "It's a compliant"
    else
      @main.next
    end 
  end
end

class NewLocationHandler < BaseHandler
  def handle_request request
    if request == 'new location'
      return "It's a new location"
    else
      @main.next
    end
  end
end

class DefaultHandler < BaseHandler
  def handle_request request
    return 'It was not a category'
  end
end

puts RequestHandler.handle_request('dadsada')
puts RequestHandler.handle_request('spam')