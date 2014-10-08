# Spiking
require_relative 'robot'
require_relative 'grid'
require_relative 'mission'

require 'json'

class MissionControl

  attr_reader :params, :robots, :grid

  def initialize( input_file, 
                  robot_type,
                  position_type, 
                  grid_type,
                  square_type, 
                  mission_type,
                  instruction_type
                )
    @in_file          = input_file
    @robot_type       = robot_type
    @position_type    = position_type
    @grid_type        = grid_type
    @square_type      = square_type
    @mission_type     = mission_type
    @instruction_type = instruction_type
    @params           = get_mission_params
    launch
  end

  def launch
    create_robots
    create_grid
    complete_mission
  end

  private

  def get_mission_params
    raw = infile_to_a
    { grid_max: raw.first.shift, robots: robot_params(raw)}
  end

  def robot_params(raw)
    raw.map{ |entry| { position: entry[0], mission: entry[1] }  }
  end

  def infile_to_a
    File.read(@in_file).split("\n\n").map{ |group| group.split("\n") }
  end

  def create_robots
    @robots = params[:robots].map{ |robot| 
        @robot_type.new(@position_type.new(robot[:position])) }
  end

  def create_grid
    @grid = @grid_type.new(*@params[:grid_max].split('').map(&:to_i), @square_type)
  end

  def complete_mission
  end

end