# Spiking
require_relative 'robot'
require_relative 'grid'
require_relative 'mission'

class MissionControl

  def initialize( input_file, 
                  robot_type,
                  position_type, 
                  grid_type, 
                  mission_type,
                  instruction_type
                )
    @in_file          = input_file
    @robot_type       = robot_type
    @position_type    = position_type
    @grid_type        = grid_type
    @mission_type     = mission_type
    @instruction_type = instruction_type
    @params           = get_mission_params
    launch
  end

  def launch(params)
    create_robots
    create_grid
    complete_mission
  end

  private

  def get_mission_params
    to_JSON(@infile)
  end

  # Get data into this format
  # { grid: '53', robots: [
    #   { position: '11E', mission: 'RFRFRFRF'},
    #   { position: '32N', mission: 'FRRFLLFFRRFLL'},
    #   { position: '03W', mission: 'LLFFFLFLFL'} 
    #  ]
  # }

  def create_robots(params)
    @robots = params[:robots].map{ |robot| 
        @robot_type.new(@position_type.new(robot[:position])) }
  end

  def create_grid(params)
  end

  def complete_mission(params)
  end

end