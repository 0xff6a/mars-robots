require_relative 'square'

class Grid

  attr_reader :x_max, :y_max, :squares

  def initialize(x_max, y_max, content)
    @x_max = x_max
    @y_max = y_max
    @squares = factory(content)
  end

  private

  def factory(content)
    Array.new(x_max + 1) { Array.new(y_max + 1) { content.new } }
  end

end