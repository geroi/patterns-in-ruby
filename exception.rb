#!/bin/ruby
def func num
  2/num
end
begin
  puts 'hello'
  func 0
  puts '123'
rescue
  puts 'Error occured'
end