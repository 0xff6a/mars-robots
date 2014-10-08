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

    xit 'should assign the grid to the robots' do
    end

  end

end

