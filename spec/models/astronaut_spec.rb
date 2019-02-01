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

  describe 'Class Method Tests' do
    it 'can calculate average age' do
      @astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      @astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 54, job: "Cool name")
      @astronaut_3 = Astronaut.create(name: "Buzz Lightyer", age: 5, job: "to infinity")
      @astronauts = Astronaut.all

      avg_age = @astronauts.average_age

      expect(avg_age).to eq(32)
    end
  end

  describe 'Instance Method Tests' do
    it 'can calculate total space time' do
      @astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      @astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 54, job: "Cool name")
      @astronaut_3 = Astronaut.create(name: "Buzz Lightyer", age: 5, job: "to infinity")
      @mission_1 = @astronaut_1.missions.create(title: "Apollo 13", time_in_space: 760)
      @mission_2 = @astronaut_1.missions.create(title: "Capricorn 4", time_in_space: 65)
      @mission_3 = @astronaut_2.missions.create(title: "Gemini 7", time_in_space: 2740)

      time_1 = @astronaut_1.space_time
      time_2 = @astronaut_2.space_time
      time_3 = @astronaut_3.space_time

      expect(time_1).to eq(825)
      expect(time_2).to eq(2740)
      expect(time_3).to eq(0)
    end
  end

end
