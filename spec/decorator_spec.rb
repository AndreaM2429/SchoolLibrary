require_relative '../decorator'
require_relative '../nameable'

describe Decorator do
  let(:nameable) { Nameable.new }
  let(:decorator) { Decorator.new(nameable) }

  describe 'When testing Decorator class' do
    it 'should initialize with a Nameable object' do
      expect(decorator.instance_variable_get(:@nameable)).to eq(nameable)
    end
  end

  describe 'When testing the method correct_name of Decorator class' do
    it 'should delegate correct_name to the wrapped Nameable object' do
      allow(nameable).to receive(:correct_name).and_return('Nicolas Emiliano')
      expect(decorator.correct_name).to eq('Nicolas Emiliano')
    end
  end
end
