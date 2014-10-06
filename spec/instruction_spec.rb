require 'instruction'

describe Instruction do
  
  let(:instruction) { Instruction.new('F') }

  context 'F-code' do

    it 'should convert an F instruction into a +1 distance' do
      expect(instruction.distance).to eq 1
    end

    it 'should convert an F instruction into 0 rotation' do
      expect(instruction.rotation).to eq 0
    end

  end

  context 'R-code' do

    let(:r_ins) { Instruction.new('R') }

    it 'should convert an R instruction into a 0 distance' do
      expect(r_ins.distance).to eq 0
    end

    it 'should convert an R instruction into 90 rotation' do
      expect(r_ins.rotation).to eq 90
    end

  end

  context 'L-code' do

    let(:l_ins) { Instruction.new('L') }

    it 'should convert an L instruction into a 0 distance' do
      expect(l_ins.distance).to eq 0
    end

    it 'should convert an F instruction into -90 rotation' do
      expect(l_ins.rotation).to eq -90
    end

  end

end