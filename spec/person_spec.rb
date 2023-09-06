require_relative '../person'
require_relative '../book'

describe Person do
  book = Book.new('Die Verwandlung', 'Franz Kafka')
  it 'Create a new Person class object' do
    person = Person.new(24, '', 'Francisca')

    expect(person.class).to eq Person
  end

  it 'Create a new person with parent permission' do
    person = Person.new(24, '', 'Nicolas')

    expect(person.parent_permission).to be true
  end

  it 'Create a new person without the parent permission' do
    person = Person.new(24, '', 'Javier', parent_permission: false)

    expect(person.parent_permission).to be false
  end

  it 'Can use services without the parent permission because the persone is over age' do
    person = Person.new(24, '', 'Andrea', parent_permission: false)

    expect(person.can_use_services?).to be true
  end

  it "Can't use services without the parent permission because the persone is under age" do
    person = Person.new(13, '', 'Oscar', parent_permission: false)

    expect(person.can_use_services?).to be false
  end

  it 'Add new rental to the person' do
    person = Person.new(24, '', 'Carlota')

    person.add_rental(book, '24/01/2000')

    expect(person.rentals.length).to eq 1
    expect(person.rentals[0].book.title).to eq 'Die Verwandlung'
  end

  it "Name should return the person's name" do
    person = Person.new(24, '', 'Maximiliano')

    expect(person.correct_name).to eq 'Maximiliano'
  end
end
