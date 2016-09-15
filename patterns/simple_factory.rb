class Factory
  def self.build class_name
    const_get(class_name.to_s.capitalize).new
  end
end

class Brick
end
class Block
end

puts entity = Factory.build(:brick)
puts entity = Factory.build(:block)
