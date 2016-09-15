#методы проходят насквозь
class AccountProxy < BasicObject 

#в таком случае, наследуяот BasicObject,
# Proxy забираем минимальное количество методов,
# в частности inspect, length и прочие методы

  attr_accessor :user
  def initialize(user, account)
    @target = account
    @user = user
  end

  def method_missing method, *args, &block
    if access_allowed?
      @target.send method, *args, &block
    else
      puts 'ACCESS DENIED'
    end
  end

  def access_allowed?
    user.authenticated?
  end

end

class Account
  def initialize(amount)
    @amount = amount
  end

  def deposit(amount)
    @amount += amount
  end

  def withdraw(amount)
    @amount -= amount
  end

  def balance
    @amount
  end

  def inspect
    puts "Amount: #{@amount}"
  end

end

class User
  attr_accessor :access
  def authenticated?
    access
  end
end

class AccessError < StandardError
end

user_allowed = User.new
user_allowed.access = true

user_not_allowed = User.new
user_not_allowed.access = false

account = AccountProxy.new(user_allowed, Account.new(1000))
puts account.balance

account.user = user_not_allowed
puts account.balance