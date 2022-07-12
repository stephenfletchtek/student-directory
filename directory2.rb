# let's put all students into an array
# hobby, country, height
students = [
{name: "Dr. Hannibal Lecter", cohort: :november, hobby: :chess, country: :UK, height: "2m"},
{name: "Darth Vader", cohort: :november, hobby: "", country: "", height: ""},
{name: "Nurse Ratched", cohort: :november, hobby: "", country: "", height: ""},
{name: "Michael Corleone", cohort: :november, hobby: "", country: "", height: ""},
{name: "Alex DeLarge", cohort: :november, hobby: "", country: "", height: ""},
{name: "The Wicked Witch of the West", cohort: :november, hobby: "", country: "", height: ""},
{name: "Terminator", cohort: :november, hobby: "", country: "", height: ""},
{name: "Freddy Krueger", cohort: :november, hobby: "", country: "", height: ""},
{name: "The Joker", cohort: :november, hobby: "", country: "", height: ""},
{name: "Joffrey Baratheon", cohort: :november, hobby: "", country: "", height: ""},
{name: "Norman Bates", cohort: :november, hobby: "", country: "", height: ""}
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# add index number
def print(names, search="")
  if search.to_i != 0
    names.each_with_index do |name, index|
      puts "#{index + 1}. #{name[:name][0 , search.to_i]} (#{name[:cohort]} cohort)"
    end
  elsif search != ""
    names.each_with_index do |name, ind|
      if name[:name][0] == search
        puts "#{ind + 1}. #{name[:name]} (#{name[:cohort]} cohort)"
      end
    end  
  else

    # while loop technique 
    index = 0
    while index < names.length()
      record = names[index]
      puts "#{index + 1}. #{record[:name]} (#{record[:cohort]} cohort)"
      puts = "Hobby: #{record[:hobby]} Country: #{record[:country]} Height: #{record[:height]}"
      index += 1
    end

    # names.each {} technique
    # names.each_with_index do |name, index|
    #   puts "#{index + 1}. #{name[:name]} (#{name[:cohort]} cohort)"
    # end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add student hash to the array
    students << {name: name, cohort: :november, hobby: :chess, country: :UK, height: "2m"}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return array of students
  students
end

def do_filter
  puts "Enter a number to chop length"
  puts "Enter an intitial to search"
  puts "Or leave blank to show all names"
  return gets.chomp
end

# students = input_students
print_header
print(students, do_filter)
print_footer(students)