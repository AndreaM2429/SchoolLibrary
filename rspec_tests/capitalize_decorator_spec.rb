require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  let(:nameable_mock) { double("Nameable") }

  context "When testing correct_name method of CapitalizeDecorator class" do
    it "should capitalizes the name correctly" do
      allow(nameable_mock).to receive(:correct_name).and_return("andrea")
      decorator = CapitalizeDecorator.new(nameable_mock)

      expect(decorator.correct_name).to eq("Andrea")
    end
  end
end
