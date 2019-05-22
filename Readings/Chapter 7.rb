def word_sorter
  mywords = []
  blankline = false
  until blankline
    puts "Please add a word."
    wordtoadd = gets.chomp
     wordtoadd != "" ? mywords = mywords.push(wordtoadd) : blankline = true
  end

  mywords = mywords.sort
  mywords.each { |item| puts item }

end

word_sorter

# Helper function for word_sorter_2
def sort_array(my_arr)
  
  for i in 2..my_arr.length
    to_place = my_arr[i-1]
    for j in 0..i-1
      if my_arr[j] > to_place
        container = my_arr[j]
        my_arr[j] = my_arr[i-1]
        my_arr[i-1] = container
      end
    end
  
  end
  
  my_arr
  
end

#test
#sort_array([2,3,4,1,3,4,5,2,4,8,4])

def word_sorter_2

  my_words = []
  blankline = false
  until blankline
    puts "Please add a word."
    wordtoadd = gets.chomp
     wordtoadd != "" ? my_words = my_words.push(wordtoadd) : blankline = true
  end
  
  sort_array(my_words)
  my_words.each {|x| puts x}
  
end

word_sorter_2

def new_table_of_contents
  line_length = 50
  title = "Table of Contents"

  chapters = ["Chapter 1:  Numbers", "Chapter 2:  Letters", "Chapter 3:  Variables"]
  page_nums = ["page 1", "page 72", "page 118"]
  
  puts title.center(line_length)
  for i in 0..(chapters.length-1)
    puts chapters[i].ljust(line_length/2) + page_nums[i].rjust(line_length/2)
  end

end

new_table_of_contents
