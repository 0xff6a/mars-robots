require_relative 'position'

class Robot

  attr_reader :lost
  attr_accessor :position

  def initialize(position)
    @position = position
    @lost = false
  end

  def lost?
    lost
  end

  def lose!
    @lost = true
    @position = nil
  end

  def execute_maneuver(instruction)
    position.update(instruction)
  end

end 