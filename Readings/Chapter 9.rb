### 1 billion seconds

born = Time.mktime(1991, 3, 28, 21, 49)
puts (born + 1_000_000_000)

#########

### Happy Birthday

# Helper function: count leap years so that we can count how many birthdays have happened accurately

def leap_years(start, ending)
  
  leapcounter = 0
  
  current = start
  until (current % 4 == 0 and current % 100 != 0) or current % 400 == 0
    current += 1
  end
  
  while current <= ending
    leapcounter += 1 unless current % 100 == 0
    leapcounter += 1 if current % 400 == 0
    current += 4
  end
  return leapcounter
end

def happybirthday
  
  puts "Year of Birth?"
  myyear = gets.chomp.to_i
  
  puts "Month of Birth?"
  mymonth = gets.chomp.to_i
  
  puts "Day of Birth?"
  myday = gets.chomp.to_i

# Need to account for fact that he is born at age 0 and therefore does not get any recognition
# I.e. birth != birthday
  dbirth = Time.mktime(myyear, mymonth, myday) + 60 * 60 * 24 * 365
  
  until dbirth > Time.now
  
    leapdays = leap_years(dbirth.year, Time.now.year)
  
    if leap_years(Time.now.year, Time.now.year) > 0
      isleapyear = true
    else 
      isleapyear = false
    end
  
    # the leap_years counting function will count this year even if the actual day hasn't passed yet.
    # if it's a leap year but before the 29th of february, remove it from the count to be subtracted
    leapdays -= 1 if isleapyear && Time.now < Time.mktime(Time.now.year, 2, 29)
  
    puts "SPANK!"
    dbirth += leapdays * 60 * 24
    dbirth += 60 * 60 * 24 * 365
  
  end
end

happybirthday

#########

### Cheating dice

class Die

  def initialize
    # I'll just roll the die, though we
    # could do something else if we wanted
    # to, like setting the die with 6 showing.
    roll
  end

  def roll
    @numberShowing = 1 + rand(6)
  end

  def showing
    @numberShowing
  end
  
  def cheat(num)
    if num >= 1 && num <= 6 && num.to_i == num
      @numberShowing = num
    else
      puts "We can't cheat so hard that it's not a 1 through 6 integer... Try again"
      @numberShowing = cheat(gets.chomp.to_i)
    end
  end
end

die = Die.new
die.roll
puts die.showing
puts die.showing
die.roll
puts die.showing
puts die.showing

die.cheat(1)
puts die.showing
puts die.showing
die.cheat(2)
puts die.showing
puts die.showing
die.cheat(3)
puts die.showing
puts die.showing
die.cheat(4)
puts die.showing
puts die.showing
die.cheat(5)
puts die.showing
puts die.showing
die.cheat(6)
puts die.showing
puts die.showing
die.cheat(7)
puts die.showing
puts die.showing
die.cheat(3.5)
puts die.showing
puts die.showing

class OrangeTree
  
  def initialize
    @height = 0
    @age = 0
    @fruits = 0
  end
  
  def height
    puts @height
  end
  
  def oneYearPasses
    #tree grows 2 ft per year
    @height += 2
    
    #tree ages 1 year
    @age += 1
    
    # If the tree is older than 20 it makes one extra fruit per year (e.g. a 40 year old tree will make 20 fruits.)
    # Fruits also drop between years
    @fruits += @age - 20 if @age > 20  
    
    # If over 50, the tree dies
    if @age > 50
      puts "The old tree has died..."
    end
  end
    
  def countTheOranges
    @fruits
  end
    
  def pickAnOrange
    if @fruits > 0
      @fruits -= 1
      puts "Mmm that was a tasty orange"
    elsif @age <= 20
      puts "The tree is too young to have fruit"
    else
      puts "Sorry, there are no oranges left this year..."
    end
  end
    
end

#tests cover all transitional points of the class
tree = OrangeTree.new
tree.height
tree.pickAnOrange
20.times {tree.oneYearPasses}
tree.height
tree.pickAnOrange
tree.oneYearPasses
tree.height
2.times {tree.pickAnOrange}
29.times {tree.oneYearPasses}
tree.height
tree.pickAnOrange
tree.oneYearPasses
tree.height
tree.pickAnOrange

class Dragon

  def initialize name
    @name = name
    @starved = false
    @asleep = false
    @stuffInBelly     = 10  # He's full.
    @stuffInIntestine =  0  # He doesn't need to go.

    puts @name + ' is born.'
  end

  def feed
    puts 'You feed ' + @name + '.'
    @stuffInBelly = 10
    passageOfTime
  end

  def walk
    puts 'You walk ' + @name + '.'
    @stuffInIntestine = 0
    passageOfTime
  end

  def putToBed
    puts 'You put ' + @name + ' to bed.'
    @asleep = true
    3.times do
      if @asleep
        passageOfTime
      end
      if @asleep
        puts @name + ' snores, filling the room with smoke.'
      end
    end
    if @asleep
      @asleep = false
      puts @name + ' wakes up slowly.'
    end
  end

  def toss
    puts 'You toss ' + @name + ' up into the air.'
    puts 'He giggles, which singes your eyebrows.'
    passageOfTime
  end

  def rock
    puts 'You rock ' + @name + ' gently.'
    @asleep = true
    puts 'He briefly dozes off...'
    passageOfTime
    if @asleep
      @asleep = false
      puts '...but wakes when you stop.'
    end
  end

  def checkstarved # to allow us to leave the dispatch progrm later on
    return @starved
  end

  private

  # "private" means that the methods defined here are
  # methods internal to the object.  (You can feed
  # your dragon, but you can't ask him if he's hungry.)

  def hungry?
    # Method names can end with "?".
    # Usually, we only do this if the method
    # returns true or false, like this:
    @stuffInBelly <= 2
  end

  def poopy?
    @stuffInIntestine >= 8
  end

  def passageOfTime
    if @stuffInBelly > 0
      # Move food from belly to intestine.
      @stuffInBelly     = @stuffInBelly     - 1
      @stuffInIntestine = @stuffInIntestine + 1
    else  # Our dragon is starving!
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' is starving!  In desperation, he ate YOU!'
      @starved = true
      #exit  # This quits the program. DB: but I want the other code to continue. Maybe make a module?
    end

    if @stuffInIntestine >= 10
      @stuffInIntestine = 0
      puts 'Whoops!  ' + @name + ' had an accident...'
    end

    if hungry?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + '\'s stomach grumbles...'
    end

    if poopy?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' does the potty dance...'
    end
  end

end

def dragongame
  puts "What will you name the dragon?"
  pet = Dragon.new (gets.chomp)
  
  while true
    puts "What would you like to do with the dragon?"
    puts "feed, walk, bed, toss, rock, or quit"
    actionchosen = gets.chomp.downcase
    case actionchosen
      when "feed"
        pet.feed
      when "walk"    
        pet.walk
      when "bed"
        pet.putToBed
      when "toss"
        pet.toss
      when "rock"
        pet.rock
      when "quit"
        puts "bye, bye!"
        break
      else
        puts "Sorry, that's not a valid dragon command."
    end
    break if pet.checkstarved 
  end
end

dragongame
