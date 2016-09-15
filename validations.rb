module Assertions #Validations - проверки
  def assert &block
    raise ArgumentError unless block.call
  end
end

class SquareRootCalculator
  extend Assertions # extend - добавляет методы КЛАССУ, include - добавляет методы объекту(instance)

  def self.calculate number
    assert { number > 0 && number.is_a?(Numeric) } # проверка

    Math.sqrt number #операция
  end
end

SquareRootCalculator.calculate 10
# SquareRootCalculator.calculate -10