НЕТ = false
ДА = true
class Buter#Бутерброд
  def initialize
    @с_чем = НЕТ 
  end

  def self.создать
    self.new
  end
end
Buter.создать