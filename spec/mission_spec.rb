require 'mission'

describe Mission do
  
  # let(:mission) { Mission.new('RFRLF', Instruction) }

  xcontext 'initialisation' do

    it 'should create an array of instructions from an input string' do
      expect(mission.instructions.map(&:code).join('')).to eq 'RFRLF'
    end

    it 'should raise an error if the mission string is greater than 100 characters' do
      expect{ Mission.new('R' * 101, Instruction) }.to raise_error(RuntimeError)
    end

  end

end