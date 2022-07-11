# let's put all students into an array
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]
# and then print them
puts "The students of Villains Academy"
puts "-------------"
# finally, we print the total number of students
students.each { |student| puts student }
puts "Overall, we have #{students.count} great students"