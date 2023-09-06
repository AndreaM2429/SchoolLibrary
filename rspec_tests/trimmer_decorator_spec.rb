require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable_mock) { double("Nameable") }

  context "When testing correct_name method of TrimmerDecorator class" do
    it "should trim the name to a maximum of 10 characters" do
      allow(nameable_mock).to receive(:correct_name).and_return("Javier Andrés Grau Jipoulou")
      decorator = TrimmerDecorator.new(nameable_mock)

      expect(decorator.correct_name).to eq("Javier And")
    end

    it "should not trim names shorter than 10 characters" do
      allow(nameable_mock).to receive(:correct_name).and_return("Javi")
      decorator = TrimmerDecorator.new(nameable_mock)

      expect(decorator.correct_name).to eq("Javi")
    end
  end
end
