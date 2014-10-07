require_relative 'position'

class Robot

  attr_reader :lost
  attr_accessor :position, :grid

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

  def execute_mission(mission)
    mission.instructions.each{ |instruction| execute_maneuver(instruction) }
  end

  def execute_maneuver(instruction)
    new_position = position_from(instruction)
    off_world?(new_position) ? disappear! : @position = new_position
  end

  private

  def disappear!
    leave_scent
    lose!
  end

  def off_world?(simulated_position)
    simulated_position.x > grid.x_max || simulated_position.y > grid.y_max
  end

  def leave_scent
    grid.squares[position.x][position.y].scent!
  end

  def position_from(instruction)
    position.clone.update(instruction)
  end

end 