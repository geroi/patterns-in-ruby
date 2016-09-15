class Family
  def initialize last_name
    @last_name = last_name
    @family = []
  end

  def add_father name
    add_member(name, :father, :male)
  end
  def add_mother name
    add_member(name, :mother, :female)
  end
  def add_child name, gender
    add_member(name, :child, gender)
  end

  def each_member &block
    @family.each {|member|
      yield member
    }
  end

  def add_member name, role, gender
    @family.push(Member.new(name, @last_name, role, gender))
  end
end

class Member
  attr_reader :name, :last_name, :role, :gender
  def initialize name, last_name, role, gender
    @name = name
    @last_name = last_name
    @role = role
    @gender = gender    
  end
end

family = Family.new "Jackson"
family.add_father 'John'
family.add_mother 'Monica'
3.times {|i| family.add_child "Child #{i}", :female }
family.each_member {|member| puts member.name; puts member.gender }