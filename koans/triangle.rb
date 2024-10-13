# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#

# triangle.rb

class TriangleError < StandardError; end

def triangle(a, b, c)
  sides = [a, b, c].sort

  # Check for invalid side lengths (non-positive numbers)
  raise TriangleError if sides.any? { |side| side <= 0 }

  # Check for triangle inequality violation (sum of the two smallest sides must be greater than the third)
  raise TriangleError if sides[0] + sides[1] <= sides[2]

  # Determine the type of triangle based on side lengths
  if a == b && b == c
    :equilateral
  elsif a == b || b == c || a == c
    :isosceles
  else
    :scalene
  end
end

