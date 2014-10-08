require_relative 'robot'
require_relative 'grid'
require_relative 'mission'

class MissionControl

  attr_reader :params, :robots, :missions, :grid

  def initialize( input_file, objects)
    @in_file          = input_file
    @objects          = objects
    @params           = params_from_datastore
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

  def params_from_datastore
    raw = infile_to_a
    { grid_max: raw.first.shift, robots: robot_params(raw), missions: mission_params(raw) }
  end

  def robot_params(raw)
    raw.map{ |entry| { position: entry[0] } }
  end

  def mission_params(raw)
    raw.map{ |entry| { codes: entry[1] } }
  end

  def infile_to_a
    File.read(@in_file).split("\n\n").map{ |group| group.split("\n") }
  end

  def create_robots
    @robots = params[:robots].map{ |robot_param| robot_factory(robot_param) }
  end

  def robot_factory(param)
    @objects[:robot].new(@objects[:position].new(param[:position]))
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
    @missions = params[:missions].map{ |mission_param| mission_factory(mission_param) }
  end

  def mission_factory(param) 
    @objects[:mission].new(param[:codes], @objects[:instruction])
  end

end