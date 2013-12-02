=begin
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
=end 

class Integer
  def factorial
    (1..self).inject(:*) || 1
  end 
end 

def pascal_triangle(n, k)
  n.factorial / (k.factorial * (n - k).factorial)
end 

puts pascal_triangle(20 * 2, 20)
