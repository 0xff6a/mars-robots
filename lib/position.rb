class Position

  attr_reader :x, :y, :theta

  COMPASS_PTS = 
  {
    'N' => 0,
    'E' => 90,
    'S' => 180,
    'W' => 270
  }

  def initialize(position_string)
    @theta = theta_from(position_string)
    @x, @y = coordinates_from(position_string.chop!)
    valid?
  end

  def orientation
    COMPASS_PTS.invert[theta]
  end

  def update(instruction)
    update_theta(instruction)
    update_x(instruction)
    update_y(instruction)
    self
  end

  private 

  def coordinates_from(string)
    [string[0, string.length / 2], string[string.length / 2, string.length  / 2 ]].map(&:to_i)
  end

  def theta_from(position_string)
    COMPASS_PTS[position_string.chars.last]
  end

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