# Write a program that computes Pascal's triangle up to a given number of rows.

# In Pascal's Triangle each number is computed by adding the numbers to the right and left of the current position in the previous row.

#1      1
#2     1 1
#3    1 2 1
#4   1 3 3 1   => 1, 1+2, 1+2, 1
#5  1 4 6 4 1  => 1, 1+3, 3+3, 3+1, 1
#6 1 5 10 10 5 1 => 1, 1+4, 4+6, 6+4, 4+1, 1
# # ... etc

class Triangle
  def initialize(max_rows)
    @max_rows = max_rows
  end

  def rows
    row = [1]

    (@max_rows - 1).times.map do
      row = row.each_cons(2).map { |a, b| a + b }.unshift(1).push(1)
    end.unshift([1])
  end
end

p Triangle.new(20).rows.last
