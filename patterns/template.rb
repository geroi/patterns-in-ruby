=begin
Суть паттерна заключается в том, чтобы общий метод заключить в один базовый класс,
 а детали реализации вынести в отдлельные классы, наслдеующие от базового. Таким
 образом, Generator будет базовым классом(template), а реализацией будет Html и Markdown

Template Method использует наследование для модификации части алгоритма. Стратегия использует делегирование для модификации всего алгоритма.
Стратегия изменяет логику отдельных объектов. Template Method изменяет логику всего класса.
Фабричные методы часто вызываются из шаблонных методов.
=end


module Newsletter
  class Generator
    def initialize

    end

    def render text
      head
      content text
    end
  end

class Html < Generator

  def head
    %Q{<h1>Head title</h1>}
  end

  def content text
    %Q{<p>#{text}</p>}
  end
end
class Markdown < Generator
  def head
    %Q{#Head title}
  end

  def content text
    %Q{--#{text}}
  end
end
end

body = "<p>Hello world</p>"
html = Newsletter::Html.new.render(body)
