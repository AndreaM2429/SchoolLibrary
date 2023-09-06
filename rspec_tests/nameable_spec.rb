require_relative '../nameable'

describe Nameable do
  let(:nameable) { Nameable.new }

  describe 'When testing Nameable class' do
    it 'should raises NoMethodError for correct_name method' do
      expect { nameable.correct_name }.to raise_error(NoMethodError)
    end
  end
end
