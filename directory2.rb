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

@students = []

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# grouped by cohort for question 8
def print_students_list
  # q12 only print if 'students' list is not empty
  if @students.length != 0
    # cohort list
    cohort_list = @students.each.map { |item| item[:cohort]}
    #unique cohorts only
    cohort_list = cohort_list.uniq
    # by cohort
    cohort_list.each do |cohort|
      puts "#{cohort} cohort:"
      @students.each_with_index do |record, ind|
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

def print_footer
  # question 9 plural - fixed to show 's' when zero too
  @students.count == 1 ? (plural = "") : (plural = "s")
  puts "Overall, we have #{@students.count} great student#{plural}"
end

def input_students
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
    @students << student
    # fix plural here
    @students.count == 1 ? (plural = "") : (plural = "s")
    puts "Now we have #{@students.count} student#{plural}"
    puts "Add another student? [Y/n]"
    input = gets.chomp
    break if input.upcase == "N"

  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end 

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  while true
    print_menu
    process(gets.chomp)
  end
end

interactive_menu