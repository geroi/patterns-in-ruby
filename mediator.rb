#суть класса во взимодействии объектов через посредника
# в данном случае объекты - коллекция виджетов,
# медиатор - директор.
require 'pry'
class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end

class Director
  @@collection = {}

  def self.notify widget
    widget_class = widget.class
    @@collection[widget_class.to_s.underscore.to_sym][object.caption.to_sym] = object
      # case widget_class
      # when TextBox
      #   @@collection[:text_box][object.caption.to_sym] = object
      # when ListBox
      #   @@collection[:list_box][object.caption.to_sym] = object
      # when CheckBox
      #   @@collection[:check_box][object.caption.to_sym] = object
      # else
      #   puts widget_class
      # end
  end

  def self.get_check_box_value caption
    @@collection[:check_box][caption].value
  end
  def self.get_text_box_value caption
    @@collection[:text_box][caption].value
  end
  def self.get_list_box_value caption
    @@collection[:list_box][caption].value
  end
end

class Directed
  attr_reader :caption, :value
  def initialize options={}
    @caption = options[:caption]
    @value = options[:value]
  end

  def update options={}
    @caption = options[:caption]
    @text = options[:text]
    Director.notify(self)
  end
end

class TextBox < Directed
end

class ListBox < Directed
end

class CheckBox < Directed
end

class Button
  def initialialize
  end
  def click
    check = Director.get_check_box_value "Комедия".to_sym
    text = Director.get_text_box_value "Автор".to_sym
    list = Director.get_list_box_value "Книги".to_sym
    puts %Q{ #{check} #{text} #{list} }
  end
end

new_text_box = TextBox.new
new_text_box.update({caption: :"Комедия", value: true})
new_check_box = CheckBox.new
new_check_box.update({caption: :"Автор", value: "Иванов"})
new_list_box = ListBox.new
new_list_box.update({caption: :"Книги", value: [1,2,3]})

button = Button.new
button.click