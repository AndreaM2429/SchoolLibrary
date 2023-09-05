require 'json'

class PreservePeople
  def gets_people
    return unless File.exist?('./people.json')

    saved_people = []
    file = File.read('./people.json')
    data_hash = JSON.parse(file)
    data_hash.each do |person|
      if person['class'] == 'Student'

        saved_people << Student.new(person['age'], person['classroom'], person['id'],
                                    person['name'], parent_permission: person['parent_permission'])
      elsif person['class'] == 'Teacher'
        saved_people << Teacher.new(person['age'], person['specialization'], person['id'], person['name'])
      end
    end
    saved_people
  end

  def save_people(people)
    return if people.empty?

    data_hash = []
    people.each_with_index do |person, _index|
      if person.is_a?(Student)
        data_hash << { age: person.age, classroom: person.classroom, name: person.name,
                       parent_permission: person.parent_permission, class: person.class, id: person.id,
                       rentals: person.rentals }
      elsif person.is_a?(Teacher)
        data_hash << { age: person.age, specialization: person.specialization, name: person.name, class: person.class,
                       id: person.id, rentals: person.rentals }
      end
    end
    File.write('./people.json', JSON.dump(data_hash))
  end
end
