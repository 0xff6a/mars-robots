require 'square'

describe Square do
  
  let(:square) { Square.new }

  it 'should not have a lost robot scent initially' do
    expect(square).not_to be_scented
  end

  it 'can acquire a scent' do
    square.scent!
    expect(square).to be_scented
  end

end