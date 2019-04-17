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
def triangle(a, b, c)
  sorted = [a, b, c].sort
  max = sorted[2]
  mid = sorted[1]
  min = sorted[0]

  if min <= 0 or max >= mid + min
    raise TriangleError
  end

  if a == b and b == c
    :equilateral
  elsif max == mid or mid == min
    :isosceles
  else
    :scalene
  end

end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
