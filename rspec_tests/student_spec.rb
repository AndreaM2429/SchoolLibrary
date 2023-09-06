require_relative '../student'

describe Student do
  context 'When testing the Student class' do
    it 'should return the student age: 10' do
      @student = Student.new(10, '3a', '', 'Nicolas', parent_permission: true)
      puts @student.age
      expect(@student.age).to eq 10
    end

    it 'should return the student classroom: 3a' do
      @student = Student.new(10, '3a', '', 'Nicolas', parent_permission: true)
      puts @student.classroom
      expect(@student.classroom).to eq '3a'
    end

    it 'should return the student Name: Nicolas' do
      @student = Student.new(10, '3a', '', 'Nicolas', parent_permission: true)
      puts @student.name
      expect(@student.name).to eq 'Nicolas'
    end

    it 'should return the student Parent Permission: true' do
      @student = Student.new(10, '3a', '', 'Nicolas', parent_permission: true)
      puts @student.parent_permission
      expect(@student.parent_permission).to eq true
    end

    it 'should return `¯\\(ツ)/¯` if the student play hooky' do
      @student = Student.new(10, '3a', '', 'Nicolas', parent_permission: true)
      puts @student.play_hooky
      expect(@student.play_hooky).to eq '¯\\(ツ)/¯'
    end
  end
end
