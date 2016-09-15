require 'active_support'
require 'active_support/core_ext'

class Clerk
  def initialize department
    @department = department
  end
  delegate :name, to: :@department, prefix: :department
end
class Department
  attr_reader :name
  def initialize name
    @name = name
  end 
end

clerk = Clerk.new(Department.new('IT Department'))
clerk.department_name