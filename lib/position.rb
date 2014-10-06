class Position

  attr_accessor :x, :y, :theta

  COMPASS_PTS = 
  {
    0   => 'N',
    90  => 'E',
    180 => 'S',
    270 => 'W'
  }

  def initialize(x, y, theta)
    @x = x
    @y = y
    @theta = theta
  end

  def orientation
    COMPASS_PTS[theta]
  end

  def update(instruction)
    @theta = (@theta + instruction.rotation) % 360
    @x += (instruction.distance *  Math.sin(0.25 * @theta * Math::PI)).round
    @y += (instruction.distance * Math.cos(0.25 * @theta * Math::PI)).round
  end

end