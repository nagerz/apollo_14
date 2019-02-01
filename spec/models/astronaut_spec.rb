require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Model Tests' do
    it 'can calculate average age' do
      @astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      @astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 54, job: "Cool name")
      @astronaut_3 = Astronaut.create(name: "Buzz Lightyer", age: 5, job: "to infinity")
      @astronauts = Astronaut.all

      avg_age = @astronauts.average_age

      expect(avg_age).to eq(32)
    end
  end
end
