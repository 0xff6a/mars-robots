require 'json'

require_relative 'robot'
require_relative 'grid'
require_relative 'mission'

class MissionControl

  attr_reader :params, :robots, :missions, :grid

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
    @params           = get_params
    build_environment
  end

  def build_environment
    create_robots
    create_grid
    create_missions
    pass_grid_to_robots
  end

  private

  def pass_grid_to_robots
    @robots.each { |robot| robot.grid = @grid }
  end

  def get_params
    raw = infile_to_a
    { grid_max: raw.first.shift, robot_params: robot_params(raw)}
  end

  def robot_params(raw)
    raw.map{ |entry| { position: entry[0], mission: entry[1] }  }
  end

  def infile_to_a
    File.read(@in_file).split("\n\n").map{ |group| group.split("\n") }
  end

  def create_robots
    @robots = params[:robot_params].map{ |robot_param| create_robot_from(robot_param) }
  end

  def create_robot_from(robot_param)
    @robot_type.new(@position_type.new(robot_param[:position]))
  end

  def create_grid
    @grid = @grid_type.new(*max_grid_coords, @square_type)
  end

  def max_grid_coords
    @params[:grid_max].split('').map(&:to_i)
  end

  def create_missions
    @missions = params[:robot_params].map{ |robot_param| create_mission_from(robot_param) }
  end

  def create_mission_from(robot_param) 
    @mission_type.new(robot_param[:mission], @instruction_type)
  end

end