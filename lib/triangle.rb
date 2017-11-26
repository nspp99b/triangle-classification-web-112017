class Triangle

  attr_reader :side_one, :side_two, :side_three

  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
  end

  def kind
    case
    when side_one <= 0 || side_two <= 0 || side_three <= 0
      raise TriangleError
    when (side_one + side_two <= side_three) || (side_one + side_three <= side_two) || (side_two + side_three <= side_one)
      raise TriangleError
    when self.side_one + self.side_two == 2 * self.side_three
      :equilateral
    when (self.side_one == self.side_two || self.side_one == self.side_three) && self.side_two != self.side_three
      :isosceles
    when self.side_two == self.side_three && self.side_two != self.side_one
      :isosceles
    when self.side_one != self.side_two && self.side_two != self.side_three
      :scalene
    end
  end
end

class TriangleError < StandardError
end
