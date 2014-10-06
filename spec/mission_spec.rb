require 'mission'

describe Mission do
  
  let(:mission) { Mission.new('RFRLF', Instruction) }

  context 'initialisation' do

    it 'should create an array of instructions from an input string' do
      expect(mission.instructions.map(&:code).join('')).to eq 'RFRLF'
    end

  end

end