# Makers student directory 
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
  data.each do |key, value|
    (key == :name || key == :height) ? (data[key] = value) : (data[key] = value.to_sym)
  end
  @students << data
end

def add_student(student)
  puts "Student details accepted"
  add_hash(student)
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

def check_filename(filename)
  if filename.nil? || filename == ""
    puts "Use default filename 'students.csv'"
    "students.csv"
  else
    filename
  end
end

def save_students(filename)
  filename = check_filename(filename)
  File.open(filename, 'w') do |f|
    @students.each do |student|
      f.puts(student.each.map { |key, value| value }.join(","))
    end
  end
  puts "#{filename} saved!"
end

def try_load_students(filename)
  filename = check_filename(filename)
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Unable to find file: #{filename}"
    exit
  end
end

def load_students(filename)
  @students = []
  File.open(filename, 'r') do |f|
    f.readlines.each do |line|
      add_hash(Hash[@categories.zip(line.chomp.split(","))])
    end
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save this list to file"
  puts "4. Load a list from file"
  puts "9. Exit"
end 

def show_students
  puts "#{@students.length} students found."
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
      puts "Enter filename to create:"
      save_students(gets.chomp)
    when "4"
      puts "Enter filename to load:"
      try_load_students(gets.chomp)
    when "9"
      puts "Goodbye!"
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

try_load_students(ARGV.first)
interactive_menu