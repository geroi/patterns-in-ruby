class PaymentServiceFactory
  def self.for entity
    if entity.is_a? User
      return UserPaymentService.new
    elsif entity.is_a? Manager
      return ManagerPaymentService.new
    end
  end
end

class ManagerPaymentService
  def pay payment_recipient, amount
    puts 'paid'
  end
end

class UserPaymentService
  def pay payment_recipient, amount
    raise InvalidPaymentServiceError, "You cannot pay unless you are a Manager"
  end
end

class User
  def initialize name
    @name = name
  end
end

class Manager
  def initialize name
    @name = name
  end    
end

class InvalidPaymentServiceError < StandardError

end

user = User.new "John Dow"
manager = Manager.new "The Boss"
service = PaymentServiceFactory.for manager
service.pay user, 500
service = PaymentServiceFactory.for user
service.pay user, 500 #error
