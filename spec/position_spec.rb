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


end