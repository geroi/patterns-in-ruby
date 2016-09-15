class Employee
  def initialize(type: :employee)
    @type = type
  end

  def base_salary
    500
  end

  def full_salary
    base_salary + bonus
  end

  def self.build(type: :regular)
    instance = new #создание экземпляра класса
    instance.extend const_get(type.capitalize) #добавление экземпляру методов из type
  end
end

module Boss
  def bonus
    1500
  end
end

module Manager
  def bonus
    800
  end
end

module Regular
    def bonus
    0
  end
end

puts Employee.build.full_salary
puts Employee.build(type: :boss).full_salary
puts Employee.build(type: :manager).full_salary