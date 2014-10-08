require 'mission_control'
require 'robot'
require 'position'

describe MissionControl do
  
  let(:m) { MissionControl.new('dummy.txt',
                                Robot,
                                Position,
                                Grid,
                                Square,
                                Mission,
                                Instruction
                              ) }

  let(:data) { "53\n11E\nRFRFRFRF"}

  before(:each) do
    allow(File).to receive(:read).and_return(data)
  end

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
      mission = double Mission
      allow(Mission).to receive(:new).and_return(mission)
      expect(m.missions.first).to eq mission
    end

  end

end

