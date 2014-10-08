require 'mission_control'
require 'robot'
require 'position'

describe MissionControl do
  
let(:objects)   { {
                    robot:       Robot,
                    position:    Position,
                    grid:        Grid,
                    square:      Square,
                    mission:     Mission,
                    instruction: Instruction            
                } }

  let(:m)       { MissionControl.new('data.txt', objects) }
  let(:data)    { "53\n11E\nRFRFRFRF"                     }
  let(:mission) { double Mission                          }

  context 'initialisation' do

    it 'should build a grid from file data' do
      expect(m.grid.x_max).to eq 5
      expect(m.grid.y_max).to eq 3
    end

    it 'should build a robot from file data' do
      expect(m.robots.first.position.x).to eq 1
      expect(m.robots.first.position.y).to eq 1
      expect(m.robots.first.position.theta).to eq 90
    end

    it 'should assign the grid to all robots' do
      expect(m.grid).to eq m.robots.first.grid
    end

    it 'should create missions from the data file' do
      allow(Mission).to receive(:new).and_return(mission)
      expect(m.missions.first).to eq mission
    end

  end

  context '#launch' do

    before(:each) do
      allow(File).to receive(:read).and_return(data)
    end

    it 'should launch a mission for each robot' do
      allow(Mission).to receive(:new).and_return(mission)
      expect(m.robots.first).to receive(:execute_mission).with(mission)
      m.launch!
    end

    it 'should receive a status code for each mission' do
      expect(m.launch!).to eq ['11E']
    end

  end

  context 'sample missions' do

    it 'should return the expected output for the sample missions' do
      expect(m.launch!).to eq ['11E', '33NLOST', '23S']
    end

  end

end

