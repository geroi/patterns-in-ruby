=begin
class Cart
  def initialize products
    @products = products
  end

  def total
    sum = 0
    @products.each {|product|
      sum += product[2]
    }
    puts sum
  end
end

cart = Cart.new(
    [
      ['Banana','yellow',75.0],
      ['Apple','red',20.5],
      ['Ukrop','green',50.1]
    ]
  )
cart.total
=end
class Cart
  def initialize products
    @products = products.map {|product| Product.new *product } #возвращает массив, в котором совершает действия с каждым элементом введенного массива
  end

  def total
    sum = 0
    @products.each {|product|
      sum += product.price
    }
  end
end

class Product
  attr_reader :name, :color, :price
  def initialize name, color, price
    @name = name
    @color = color
    @price = price
  end
end

cart = Cart.new([
      ['Banana','yellow',75.0],
      ['Apple','red',20.5],
      ['Ukrop','green',50.1]
    ])
cart.total