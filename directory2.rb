# let's put all students into an array
# hobby, country, height
# students = [
# {name: "Dr. Hannibal Lecter", cohort: :november, hobby: :chess, country: :UK, height: "2m"},
# {name: "Darth Vader", cohort: :november, hobby: "", country: "", height: ""},
# {name: "Nurse Ratched", cohort: :november, hobby: "", country: "", height: ""},
# {name: "Michael Corleone", cohort: :november, hobby: "", country: "", height: ""},
# {name: "Alex DeLarge", cohort: :november, hobby: "", country: "", height: ""},
# {name: "The Wicked Witch of the West", cohort: :november, hobby: "", country: "", height: ""},
# {name: "Terminator", cohort: :november, hobby: "", country: "", height: ""},
# {name: "Freddy Krueger", cohort: :november, hobby: "", country: "", height: ""},
# {name: "The Joker", cohort: :november, hobby: "", country: "", height: ""},
# {name: "Joffrey Baratheon", cohort: :november, hobby: "", country: "", height: ""},
# {name: "Norman Bates", cohort: :november, hobby: "", country: "", height: ""}
# ]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# grouped by cohort for question 8
def print_out(names)
  # q12 only print if 'students' list is not empty
  if names.length != 0
    # cohort list
    cohort_list = names.each.map { |item| item[:cohort]}
    #unique cohorts only
    cohort_list = cohort_list.uniq
    # by cohort
    cohort_list.each do |cohort|
      puts "#{cohort} cohort:"
      names.each_with_index do |record, ind|
        # display if in cohort
        if record[:cohort] == cohort
          puts "#{ind + 1}. #{record[:name]}"
          str = "Hobby: #{record[:hobby]}, Country: #{record[:country]}, Height: #{record[:height]}"
          # account for index number to have varying length
          num = (ind + 1).to_s.length.to_i * 2 + 4
          # align hobbies under first line 
          puts str.center(str.length + num)
        end
      end
    end
  else
    puts "No student records to show"
  end
end

def print_footer(names)
  # question 9 plural - fixed to show 's' when zero too
  names.count == 1 ? (plural = "") : (plural = "s")
  puts "Overall, we have #{names.count} great student#{plural}"
end

def input_students
  # modified for question 7
  students = []
  categories = [:name, :cohort, :hobby, :country, :height]
  while true
    student = {}
    while true
      categories.each do |category|
        puts "Enter student's #{category}"
        input = gets.chomp
        input = :blank if input == "" 
        if category == :name || category == :height
          student[category] = input
        else
          student[category] = input.to_sym
        end
      end
      puts student
      puts "Accept details? [Y/n]"
      input = gets.chomp
      break if input.upcase != "N" 

    end
    puts "Student details accepted"
    students << student
    # fix plural here
    students.count == 1 ? (plural = "") : (plural = "s")
    puts "Now we have #{students.count} student#{plural}"
    puts "Add another student? [Y/n]"
    # question 10 alternative to gets.chomp
    input = gets
    (input = input[0,input.length - 1]) if input[-1] == "\n"
    break if input.upcase == "N"

  end
  # return array of students
  students
end

def interactive_menu
  students = []
  while true
    # print menu and ask user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print_out(students)
      print_footer(students)
    when "9"
      break

    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu