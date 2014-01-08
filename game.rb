pages_with_questions = {}  # create an empty hash

lines_grabbed = "" # empty string that will hold values for the hash
key = "" # empty string which will become the key for hash

File.open("story.txt", "r") do |infile| # perpetually open the file and start reading through file
  while (line = infile.gets) # Reads file line-by-line, but only stores one line at a time
    if line.index("~p")  # if method index called on a string is true
    	key = line.chomp # then save as key
    	lines_grabbed = ""  # and wipe remaining lines
    elsif 
      	lines_grabbed += line  # keeps grabbing lines
    end
    pages_with_questions[key] = lines_grabbed # pages with question hash will have keys = "key" and save lines_grabbed
  end
end

p1 = pages_with_questions.select do |key, value| # select method returns a new hash if block returns true
	key.index("~p1")    # block returns true if it starts with ~p1
end

p1.each do |k,v| # for each k-v pair in has p1
	puts v # print the value only
end

puts "Enter c1, c2 or c3" # prompt user to enter a choice

user_choice = gets.chomp # save user input as user_choice

choices = pages_with_questions.select do |key, value| # create new hash iterating over original array looking for a key 
	key.index user_choice 							  #that contains THE EXACT c1, c2 or c3 that user entered
end

story_key = "" # new variable established = empty string
choices.each {|k,v| story_key = "~"+k[-2]+k[-1]}  # iterate over choices hash (only one k-v pair) and store the last two chars on string as this new variable

print pages_with_questions[story_key]



#questions:
#  while (line = infile.gets)


# story:
# 1 open our story File
# 2 read the File
# 3 display the first File
# 4 get user input of the choice
# 5 go to that choice's page


# Note this is interesting ===> IO.readlines("story.txt")[10] # [line number]
