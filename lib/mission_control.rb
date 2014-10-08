require_relative 'robot'
require_relative 'grid'
require_relative 'mission'

class MissionControl

  attr_reader :params, :robots, :missions, :grid

  def initialize( input_file, objects)
    @in_file          = input_file
    @objects          = objects
    @params           = get_params
    build_environment
  end

  def launch!
    @robots.each_with_index{ |robot, index| robot.execute_mission(@missions[index]) }
    @robots.map(&:status_report)
  end

  private

  def build_environment
    create_robots
    create_grid
    create_missions
    pass_grid_to_robots
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
    @objects[:robot].new(@objects[:position].new(robot_param[:position]))
  end

  def create_grid
    @grid = @objects[:grid].new(*max_grid_coords, @objects[:square])
  end

  def max_grid_coords
    @params[:grid_max].split('').map(&:to_i)
  end

  def pass_grid_to_robots
    @robots.each { |robot| robot.grid = @grid }
  end

  def create_missions
    @missions = params[:robot_params].map{ |robot_param| create_mission_from(robot_param) }
  end

  def create_mission_from(robot_param) 
    @objects[:mission].new(robot_param[:mission], @objects[:instruction])
  end

end