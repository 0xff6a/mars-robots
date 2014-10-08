class Instruction

  CODES = 
  {
    'F' => [0, 1],
    'R' => [90, 0],
    'L' => [-90, 0]
  }

  attr_reader :code, :rotation, :distance

  def initialize(code)
    @code = code
    @rotation = set_rotation
    @distance = set_distance
  end

  private

  def set_rotation
    decoded.first
  end

  def set_distance
    decoded.last
  end

  def decoded
    CODES[code]
  end

end