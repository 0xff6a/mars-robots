require 'position'

describe Position do
  
  let(:position) { Position.new(0, 1, 90) }

  context 'initialisation' do

    it 'should have an x-value' do
      expect(position.x).to eq 0
    end

    it 'should have a y-value' do
      expect(position.y).to eq 1
    end

    it 'should have an orientation angle theta' do
      expect(position.theta).to eq 90
    end

  end

  context '#orientation' do

    it 'should convert theta to an orientation (N,S,E,W)' do
      expect(position.orientation).to eq 'E'
    end

  end

  context '#update' do

    let(:r_ins) { Instruction.new('R')  }
    let(:l_ins) { Instruction.new('L')  }
    let(:f_ins) { Instruction.new('F')  }

    it 'can modify its position based on an R instruction' do
      position.update(r_ins)
      expect(position.theta).to eq 180
      expect(position.x).to eq 0
      expect(position.y).to eq 1
    end

    it 'can modify its position based on an L instruction' do
      position.update(l_ins)
      expect(position.theta).to eq 0
      expect(position.x).to eq 0
      expect(position.y).to eq 1
    end

    it 'can modify its position based on an F instruction' do
      position.update(f_ins)
      expect(position.theta).to eq 90
      expect(position.x).to eq 1
      expect(position.y).to eq 1
    end

  end

end