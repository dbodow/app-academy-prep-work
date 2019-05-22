def grandfatherclock(&myblock)
  #convert from 24h to 12h
  hours = Time.now.hour % 12 + 1
  
  hours.times { myblock.call }
  
end

grandfatherclock do puts 'DONG!' end
grandfatherclock do 
  puts Time.now.hour
  end
grandfatherclock do 
  puts Time.now
  end

def log(description, &block)
  puts "Beginning " + description + " block"
  puts "returning: " + block.call.to_s
  puts "Ending " + description + " block"
end

log "Say hello" do "O hai Mark!" end

log "Throw football" do 
  log "throw back" do
    "Denny throws it back"
    end
  end

$nestingdepth = 0 # how many tiers you've nested
SPACES = 2 # how much to indent
def betterlogger (description, &block)
  puts (" " * $nestingdepth * SPACES) + "Beginning " + description + " block"
  $nestingdepth += 1
  puts (" " * $nestingdepth * SPACES) + "returning: " + block.call.to_s
  $nestingdepth -= 1
  puts (" " * $nestingdepth * SPACES) +  "Ending " + description + " block"
end

puts "" #separate which fcn is being tested with a new line 

betterlogger "Say hello" do "O hai Mark!" end

betterlogger "Throw back football" do 
  betterlogger "Throw football" do
    "Denny throws the football"
    end
  "Johnny throws it back."
  end
