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

  def bonus
    0
  end

  def self.build(type: :employee)
    const_get(type.capitalize).new
  end
end

class Boss < Employee
  def bonus
    1500
  end
end

class Manager < Employee
  def bonus
    800
  end
end

puts Employee.build.full_salary
puts Employee.build(type: :boss).full_salary
puts Employee.build(type: :manager).full_salary