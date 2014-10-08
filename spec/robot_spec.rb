require 'robot'

describe Robot do
  
  let(:position)  { Position.new('00E')       }
  let(:walle)     { Robot.new(position)       }
  let(:f_ins)     { Instruction.new('F')      }
  let(:mars)      { Grid.new(10, 10, Square)  }

  before(:each) do
    walle.grid = mars
  end

  context 'intialisation' do

    it 'should not be lost initially' do
      expect(walle).not_to be_lost
    end

    it 'should have a position intially' do
      expect(walle.position).to eq position
    end

  end

  context 'grid' do

    it 'can hold a grid' do
      g = double Grid
      walle.grid = g
      expect(walle.grid).to eq g
    end

  end

  context '#lose' do

    before(:each) { walle.lose! }

    it 'can be lost' do
      expect(walle).to be_lost
    end

  end

  context '#execute_maneuver' do

    it 'can modify its position based on an R instruction' do
      new_position = double Position, x: 0, y: 0
      allow(walle).to receive(:position_from).and_return(new_position)
      walle.execute_maneuver(f_ins)
      expect(walle.position).to eq new_position
    end

  end

  context '#execute_mission' do

    let(:mission) { double Mission, instructions: %w(a b) }

    it 'can modify its position based on a mission string' do
      expect(walle).to receive(:execute_maneuver).with('a')
      expect(walle).to receive(:execute_maneuver).with('b')
      walle.execute_mission(mission)
    end

  end

  context '#status_report' do

    it 'should provide a status report for a robot' do
      expect(walle.status_report).to eq '00E'
    end

    it 'should append LOST to the status report for a lost robot' do
      walle.position = Position.new('0010N')
      walle.execute_maneuver(f_ins)
      expect(walle.status_report).to eq '0010NLOST'
    end

  end

  context 'going off world' do

    before(:each) do
      walle.position = Position.new('0010N')
      walle.execute_maneuver(f_ins)
    end

    it 'should know if it goes off world' do
      expect(walle).to be_lost
    end

    it 'should leave a scent if an instruction sends it off world' do
      expect(walle.grid.squares[0][10]).to be_scented
    end

    it 'should not go off world if there is a scent on the square' do
      eva = Robot.new(Position.new('0010N'))
      eva.grid = mars
      eva.execute_maneuver(f_ins)
      expect(eva).not_to be_lost
    end

  end

end