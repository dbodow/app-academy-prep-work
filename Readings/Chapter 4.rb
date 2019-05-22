def greeter
  puts "What is your first name?"
  first = gets.chomp + " "
  
  puts "What is your middle name?"
  middle = gets.chomp + " "
  
  puts "What is your last name?"
  last = gets.chomp
  
  puts "Hello there " + first + middle + last + "!"
end

greeter

def favorite_number
  puts "What is your favorite number?"
  number = gets.chomp
  number = number.to_i + 1
  puts "Wouldn't " + number.to_s + " be better?"
end

favorite_number
