# http://cpp-reference.ru/patterns/structural-patterns/decorator/
#   Паттерн Decorator (декоратор, wrapper, обертка)
#  widget_with_border_with_button_red_color_big_text
# widget
# with_border
# with_button
# rec_color
# big_text
# Назначение паттерна Decorator

# Паттерн Decorator динамически добавляет новые обязанности объекту. Декораторы являются гибкой альтернативой порождению подклассов для расширения функциональности.
# Рекурсивно декорирует основной объект.
# Паттерн Decorator использует схему "обертываем подарок, кладем его в коробку, обертываем коробку".
# Решаемая проблема

# Вы хотите добавить новые обязанности в поведении или состоянии отдельных объектов во время выполнения программы. Использование наследования не представляется возможным, поскольку это решение статическое и распространяется целиком на весь класс.
# Использование паттерна Decorator

# Подготовьте исходные данные: один основной компонент и несколько дополнительных (необязательных) "оберток".
# Создайте общий для всех классов интерфейс по принципу "наименьшего общего знаменателя НОЗ" (lowest common denominator LCD). Этот интерфейс должен делать все классы взаимозаменяемыми.
# Создайте базовый класс второго уровня (Decorator) для поддержки дополнительных декорирующих классов.
# Основной класс и класс Decorator наследуют общий НОЗ-интерфейс.
# Класс Decorator использует отношение композиции. Указатель на НОЗ-объект инициализируется в конструкторе.
# Класс Decorator делегирует выполнение операции НОЗ-объекту.
# Для реализации каждой дополнительной функциональности создайте класс, производный от Decorator.
# Подкласс Decorator реализует дополнительную функциональность и делегирует выполнение операции базовому классу Decorator.
# Клиент несет ответственность за конфигурирование системы: устанавливает типы и последовательность использования основного объекта и декораторов.
require 'forwardable'
class SimpleText
  def initialize text
    @text = text
  end

  def write_text
    @text
  end
end
class Decorator
  extend Forwardable
  def_delegators :@text, :write_text
  def initialize simple_text
    @text = simple_text
  end
end

class Boldness < Decorator
  def write_text
    %Q{<b>#{@text.write_text}</b>}
  end
end

class Italic < Decorator
  def write_text
    %Q{<i>#{@text.write_text}</i>}
  end
end

class Paragraph < Decorator
  def write_text
    %Q{<p>#{@text.write_text}</p>}
  end
end

puts context = Paragraph.new(Italic.new(Boldness.new(Decorator.new(SimpleText.new("hello world"))))).write_text