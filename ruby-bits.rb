#если первая часть в && ложна, фторая не выполняется
if user && user.signed_in?
  #...
end

if string.match(regex) && string.match[1] == word
  #...
end

#присвоение значения, если первая часть false или nil
tweets = timeline.tweets || []

def sign_in
  current_session || sign_user_in #можно использовать вместо условия if, но код плохо читаем
end

#проверка, установлено ли значение
i_was_set ||= 10

#присвоение через условие
path = if name
  '/usr/bin'
else
  '/bin/'
end

#Range Regexp в условии case
popularity = case tweet.retweet_count
when 0..9
  nil
when 10..99
  1
end

#when then
tweet_type = case tweet.status
when /\A@\w+/     then :mention
when /\Ad\s+\w+/  then :direct_message
else              :public
end

#необязательные параметры
def tweet(message, lat = nil, long = nil)
  #..
end

#Hash в аргументах
def tweet(message, tweet={})
  #..
  tweet[:lat]
end
tweet('yo come on', lat: 10, long: 20, id: 1488)

#exceptions
def get_tweets(list)
  unless list.authorized?(@user)
    raise AuthorizationException.new
  end
  list.tweets
end

begin
  tweets = get_tweets(my_list)
rescue AuthorizationException
  warn "you are not authorized to access"
end

#массив в аргументе
def mention(status, *names)
  #..
  names[0]
  names[1]
end

#only getter, no setter
attr_reader :variable

#overrides default methods
class MyClass
  def to_s
    "#{@my_text.uppercase}"
  end
end

#внутри initialize
attr_accessor :variable
def initialize text
  self.variable = text
end

def result
  <<EOF #после << может идти любой символ/слово
  lorem ipsum
  some text with /\n
  dffdfdf
  EOF
end

 #не стоит просто держать данные, и посылать их методам
#если есть данные, стоит обернуть их в объект-класс

Encapsulation - 

Inheritance - 

super без  

# ActiveSupport
array = [0,1,2,3,4,5,6] 
array.from(4) # [4,5,6]
array.to(2) # [0,1,2]
array.in_groups_of(3) # [[0,1,2],[3,4,5],[6,nil,nil]]
array.split(2) # [[0,1][2,3,4,5,6]] 

apocalypse = DateTime.new(2015,1,1,15,0,0)
apocalypse.at_beginning_of_day
apocalypse.at_end_of_month
apocalypse.at_beginning_of_year

apocalypse.advance(years:4, months: 2, weeks:2, days:2) # +4 years + 2 months etc
.tomorrow
.yesterday

#differnece between hashes
opts1 = {a:1,b:2,c:3}
opts2 = {a:1,b:2,c:3}
opts1.diff(opts2) # {c:3}

opts2.stringify_keys

#merge
options = {lang: :fr, user: :admin}
defaults = {lang: :fr, country: :ru}
options.reverse_merge(defaults) # {lang:fr, user: :admin, :country: :ru}

#except
options = {lang: :fr, user: :admin}
options.except(:lang) # {user: :admin}
options.assert_valid_keys(:lang, :user, :code) # Exceptions if any keys besides listed in arguments


#Integer
.odd?
.even?

#Modules
module ImageUtils
  def function1
  end
  def function2
  end
end
ImageUtils.function1
ImageUtils.function2


#mixin
class ImageProcessor
  include ImageUtils
  def initialize file
    @file = file
  end
end
image_processor = ImageProcessor.new 1.jpg
image_processor.function1

#группировать функции в модули, закрывая их пространство и мен
include InstanceMethods
extend ClassMethods

#метод extend для объекта расишряет только его возможности (объекта)
image = Image.new
image.extend ImageUtils
image2 = Image.new
image2.preview # MethodErrod No such Method

#Блоки
do |variable|
 #... просто делает что-то 
end

array.each {|variable|
  #...возвращает значение
}.other_method

def some_method
  yield
  yield
end

def some_method
  yield argument
end

#Enumerable
class TweetsCollection
  include Enumerable
end
tweets = TweetsCollection.new
tweets.sort_by {|tweet| tweet.created_at }
tweets.find_all {|tweet| tweet.status }
tweets.map {|tweet| tweet.status /\@codeschool/ }
 
 #Procs
my_procedure = -> { puts 'my procedure called' }

