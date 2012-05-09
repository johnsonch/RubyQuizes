class SecretSanta
  def self.load_people(file_name)
    file = File.open(file_name)
    people = []
    file.each_line {|person| people << Person.parse(person)}
    return people
  end

  def self.assign(people)
    total_people = people.size - 1
    
    people.each_with_index do |person, i|
      santa = people[total_people - i].first_name
      person.secret_santa = santa 
      puts person.first_name
    end
  end
end

class Person
  attr_accessor :first_name, :last_name, :email, :secret_santa
  def self.parse(person)
    person_attributes = person.split(" ")
    if person_attributes.length == 3
      Person.new(:first_name => person_attributes[0],
                 :last_name => person_attributes[1],
                 :email => person_attributes[2])
    end
  end
end

describe "people" do
  before do
    @people = SecretSanta.load_people("people.txt")
  end
  it 'can read a list of people' do
    @people.length.should eql 7
  end
  
  it 'can create a person from a line'do
    luke = Person.parse("Luke Skywalker <luke@theforce.net>")
    luke.class.should eql Person
  end

  it 'can have an array of people' do
    @people.first.class.should eql Person
  end

  it 'assigns a secret santa' do
    santa_list = SecretSanta.assign(@people) 
    santa_list.each do |person|
      person.secret_santa.should_not be_nil
    end
  end

end
