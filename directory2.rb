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
@categories = [:name, :cohort, :hobby, :country, :height]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_cohort(cohort)
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

# grouped by cohort for question 8
def print_students_list
  # q12 only print if 'students' list is not empty
  if @students.length != 0
    cohort_list = @students.each.map { |item| item[:cohort]}.uniq
    cohort_list.each { |cohort| print_cohort(cohort) }
  else
    puts "No student records to show"
  end
end

def print_footer
  # question 9 plural - fixed to show 's' when zero too
  @students.count == 1 ? (plural = "") : (plural = "s")
  puts "Overall, we have #{@students.count} great student#{plural}"
end

def enter_category(category)
  puts "Enter student's #{category}"
  STDIN.gets.chomp
end

def add_hash(data)
  # bodge cohort, hobby and country to symbol
  data = data.each_with_index.map { |item, index| (index > 0 && index < 4) ? item.to_sym : item }
  @students << Hash[@categories.zip(data)]
end

def add_student(student)
  puts "Student details accepted"
  add_hash(student.each.map { |key, value| value })
  # fix plural here
  @students.count == 1 ? (plural = "") : (plural = "s")
  puts "Now we have #{@students.count} student#{plural}"
  puts "Add another student? [Y/n]"
  input = STDIN.gets.chomp 
  input.upcase
end

def confirm_student(student)
  puts student
  puts "Accept details? [Y/n]"
  input = STDIN.gets.chomp
  input.upcase
end

def input_students
  while true
    student = {}
    while true
      @categories.each { |category| student[category] = enter_category(category) }
      break if confirm_student(student) != "N"

    end
    break if add_student(student) == "N"

  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = student.each.map { |key, value| value }
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each { |line| add_hash(line.chomp.split(",")) }
  file.close
end

def try_load_students
  filename = ARGV.first
  # return if filename.nil?
  if filename.nil?
    load_students("students.csv")
    puts "Loaded default file #{filename}"
  elsif File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Unable to find file: #{filename}"
    exit
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save this list to students.csv"
  puts "4. Load the list from students.csv"
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
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  while true
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu