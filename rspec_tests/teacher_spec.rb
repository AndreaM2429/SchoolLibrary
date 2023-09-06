require_relative '../teacher'

describe Teacher do 
  context "When testing the teacher class" do 
    
    
    it "should return the teacher age: 50" do 
        @teacher = Teacher.new(50, 'Math', '', 'Nicolas')
        puts @teacher.age
        expect(@teacher.age).to eq 50
    end

    it "should return the teacher specialization: Math" do 
      @teacher = Teacher.new(50, 'Math', '', 'Nicolas')
      puts @teacher.specialization
      expect(@teacher.specialization).to eq 'Math'
    end

    it "should return the teacher Name: Nicolas" do 
      @teacher = Teacher.new(50, 'Math', '', 'Nicolas')
      puts @teacher.name
      expect(@teacher.name).to eq 'Nicolas'
    end

    it "should return true, the teacher can use the services" do 
      @teacher = Teacher.new(50, 'Math', '', 'Nicolas')
      puts @teacher.can_use_services?
      expect(@teacher.can_use_services?).to eq true
    end
  end
end
