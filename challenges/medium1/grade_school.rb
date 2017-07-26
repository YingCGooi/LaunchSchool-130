# Write a small archiving program that stores students' names along with the grade that they are in.

# In the end, you should be able to:

# Add a student's name to the roster for a grade
# "Add Jim to grade 2."
# "OK."

# Get a list of all students enrolled in a grade
# "Which students are in grade 2?"
# "We've only got Jim just now."

# Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3, etc., and students within a grade should be sorted alphabetically by name.

# "Who all is enrolled in school right now?"
# "Grade 1: Anna, Barb, and Charlie. Grade 2: Alex, Peter, and Zoe. Grade 3…"
# Note that all our students only have one name. (It's a small town, what do you want?)

# class School
#   attr_accessor :roster

#   def initialize
#     @roster = Hash.new { |h, grade| h[grade] = [] }
#   end

#   def add(name, grade)
#     roster[grade] << name
#   end

#   def grade(grade)
#     roster[grade]
#   end

#   def to_h
#     roster.sort_by { |grade, name| name.sort! && grade }.to_h
#   end
# end

hsh = {2=>["Bcd", "Abc", "Refg", "Cde"], 1=>["Hg", "Ab", "Ac"], 3=>["De", "Da", "Ad"]}
p hsh.sort_by { |k, v| v.sort! && k }.to_h

School = Class.new do
  method_names = %i[initialize add grade to_h]
  method_bodies = [ -> { @roster = Hash.new([]) },
                    -> (name, num) { (@roster[num] += [name]).sort! },
                    -> (num) { @roster[num] },
                    -> { @roster.sort.to_h } ]
  method_names.zip(method_bodies).each { |name, body| define_method(name, body) }
end

p school = School.new
p school.add("Bob", 2)
p school.add("Gracie", 2)
p school