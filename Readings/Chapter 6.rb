def ninetynine_bottles
  i = 99
  while i > 1
    puts i.to_s + " bottles of beer on the wall..."
    puts i.to_s + " bottles of beer!"
    puts "Take one down and pass it around..."
    i -= 1
    puts i.to_s + " bottles of beer on the wall..."
    puts
  end
  
  # The last one shouldn't be plural
  
    puts "1 bottle of beer on the wall..."
    puts "1 final bottle of beer!"
    puts "Take one down and pass it around..."
    puts "No more bottles of beer on the wall!"
  
end

ninetynine_bottles

def deaf_grandma
  
  bye_count = 0
  
  until bye_count >= 3

    puts "HI THERE SONNY, HOW ARE YOU?"
    response = gets.chomp

    if response == "BYE"
      puts "I DIDN'T HEAR THAT..."
      puts
      bye_count += 1
    elsif  response != response.upcase or response == ""
      puts "HUH?!  SPEAK UP, SONNY!"
      puts
      bye_count = 0
    else
      year = rand(21) + 1930
      puts "NO, NOT SINCE " + year.to_s + "!" #unless response == "BYE"
      puts
      bye_count = 0
    end
  end
  
  puts "OKAY, BYE!"
  
end

deaf_grandma

def leap_years
  
  puts "What is the starting year to check?"
  start = gets.chomp.to_i
  
  puts "What is the ending year to check?"
  ending = gets.chomp.to_i
  
  current = start
  until (current % 4 == 0 and current % 100 != 0) or current % 400 == 0
    current += 1
  end
  
  while current <= ending
    puts current unless current % 100 == 0
    puts current if current % 400 == 0
    current += 4
  end
end

leap_years

