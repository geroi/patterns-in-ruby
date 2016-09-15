=begin
class TaxSimulator
  def initialize person
    @person = person
  end

  def simulate_return(income: nil, expenses: 0, type: :dependent_worker)
    return_value = 0
    number_of_people_under_roof = 1

    if type == :dependent_worker
      return_value += income * 0.02
    else
      return_value += income * 0.04
    end

    if number_of_people_under_roof > 2
      return_value *= 1.10
    end

    if income - expenses > income * 0.05
      return_value += expenses
    end

    return_value -= expenses * 0.3
  end
end
=end


class TaxSimulator
  def initialize person
    @person = person
  end

  def simulate_return(income: nil, expenses: 0, type: :dependent_worker)
    TaxAlgorithm.new(income, expenses, type).simulate
  end
end

class TaxAlgorithm
  def initialize(income, expenses, type)
    @income = income
    @expenses = expenses
    @type = type
    @return_value = 0
    @number_of_people_under_roof = 1
  end
    
  def dependency_count
    if @type == :dependent_worker
      @return_value += @income * 0.02
    else
      @return_value += @income * 0.04
    end
  end

  def handle_number_of_people_under_roof
    if @number_of_people_under_roof > 2
      @return_value *= 1.10
    end
  end

  def high_income_rate
    if @income - @expenses > @income * 0.05
      @return_value += @expenses
    end
  end

  def final_count
    @return_value -= @expenses * 0.3
  end

  def simulate
    dependency_count
    handle_number_of_people_under_roof
    high_income_rate
    final_count
  end
end

tax = TaxSimulator.new("Jose Mota")
puts tax.simulate_return(income: 10000, expenses: 300, type: :independent_worker)