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
    @rotation = rotation_for(code)
    @distance = distance_for(code)
  end

  private

  def rotation_for(code)
    CODES.fetch(code, []).first
  end

  def distance_for(code)
    CODES.fetch(code, []).last
  end

end