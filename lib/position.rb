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

end