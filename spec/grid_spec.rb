require 'grid'

describe Grid do
  
  let(:grid) { Grid.new(5, 3, Square) }

  context 'intialisation' do

    it 'should have a max x-value' do
      expect(grid.x_max).to eq 5
    end

    it 'should have a max y-value' do
      expect(grid.y_max).to eq 3
    end

    it 'should hold x-max * y-max squares' do
      expect(square_count(grid)).to eq 24
    end

  end

  private

  def square_count(grid)
    grid.squares.flatten.select{ |sq| sq.is_a?(Square)}.count
  end

end