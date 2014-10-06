require_relative 'instruction'

class Mission

  attr_reader :instructions

  def initialize(instruction_codes, instruction_type)
    @instructions = factory(instruction_codes, instruction_type)
    valid?
  end

  private

  def factory(instruction_codes, instruction_type)
    instruction_codes.chars.map{ |code| instruction_type.new(code) }
  end

  def valid?
    raise 'Invalid code' unless instructions.length < 100
  end

end