require 'robot'

describe Robot do
  
  let(:position)  { Position.new(0, 0, 90)  }
  let(:walle)     { Robot.new(position)     }

  context 'intialisation' do

    it 'should not be lost initially' do
      expect(walle).not_to be_lost
    end

    it 'should have a position intially' do
      expect(walle.position).to eq position
    end

  end

  context '#lose' do

    before(:each) { walle.lose! }

    it 'can be lost' do
      expect(walle).to be_lost
    end

    it 'when lost it has no position' do
      expect(walle.position).to be nil
    end

  end

  context '#execute_maneuver' do

    let(:r_ins) { Instruction.new('R')  }

    it 'can modify its position based on an R instruction' do
      expect(walle.position).to receive(:update).with(r_ins)
      walle.execute_maneuver(r_ins)
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

  xcontext 'going off world' do

    it 'should leave a scent if an instruction sends it off world' do

    end

    it 'if there is a scent in its new position, the instruction is ignored' do

    end

  end

end