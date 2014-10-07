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
    valid?
  end

  def orientation
    COMPASS_PTS[theta]
  end

  def update(instruction)
    update_theta(instruction)
    update_x(instruction)
    update_y(instruction)
    self
  end

  private 

  def update_theta(instruction)
    @theta = (@theta + instruction.rotation) % 360
  end

  def update_x(instruction)
    @x += (instruction.distance *  Math.sin(0.25 * @theta * Math::PI)).round
  end

  def update_y(instruction)
    @y += (instruction.distance * Math.cos(0.25 * @theta * Math::PI)).round
  end

  def valid?
    raise 'coordinate values must be <= 50' if x > 50 || y > 50
  end

end