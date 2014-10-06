require 'robot'

describe Robot do
  
  let(:position)  { Position.new(0,0,90)  }
  let(:walle)     { Robot.new(position)   }

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

end