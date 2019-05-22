def angry_boss
  puts "WHAT DO YOU WANT?"
  desire = gets.chomp
  puts "WHADDAYA MEAN " + desire.upcase + "?!?  YOU'RE FIRED!!"
end

angry_boss

def table_of_contents

linewidth = 50

puts "Table of Contents".center(linewidth)
puts "Chapter 1:  Numbers".ljust(linewidth/2) + "page 1".rjust(linewidth/2)
puts "Chapter 2:  Letters".ljust(linewidth/2) + "page 72".rjust(linewidth/2)
puts "Chapter 3:  Variables".ljust(linewidth/2) + "page 118".rjust(linewidth/2)
  
end

table_of_contents
