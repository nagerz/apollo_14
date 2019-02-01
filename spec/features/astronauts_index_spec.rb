require 'rails_helper'

RSpec.describe 'when visitor visits astronauts index', type: :feature do
  before :each do
    @astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    @astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 54, job: "Cool name")
    @astronaut_3 = Astronaut.create(name: "Buzz Lightyer", age: 5, job: "to infinity")
    @mission_1 = @astronaut_1.missions.create(title: "Apollo 13", time_in_space: 760)
    @mission_2 = @astronaut_1.missions.create(title: "Capricorn 4", time_in_space: 65)
    @mission_3 = @astronaut_2.missions.create(title: "Gemini 7", time_in_space: 2740)
  end

  it 'can see all astronauts' do
    visit astronauts_path

    expect(page).to have_content("Astronauts:")

    within "#astronaut-#{@astronaut_1.id}" do
      expect(page).to have_content(@astronaut_1.name)
      expect(page).to have_content("Age: #{@astronaut_1.age}")
      expect(page).to have_content("Job: #{@astronaut_1.job}")
    end
    within "#astronaut-#{@astronaut_2.id}" do
      expect(page).to have_content(@astronaut_2.name)
      expect(page).to have_content("Age: #{@astronaut_2.age}")
      expect(page).to have_content("Job: #{@astronaut_2.job}")
    end
    within "#astronaut-#{@astronaut_3.id}" do
      expect(page).to have_content(@astronaut_3.name)
      expect(page).to have_content("Age: #{@astronaut_3.age}")
      expect(page).to have_content("Job: #{@astronaut_3.job}")
    end
  end

  it 'can see average age of all astronauts' do
    visit astronauts_path

    expect(page).to have_content("Average age: #{32}")
  end

  it 'can see all astronauts missions' do
    visit astronauts_path

    within "#astronaut-#{@astronaut_1.id}-missions" do
      expect(page).to have_content("Missions:")
      expect(page).to have_content("#{@mission_1.title}")
      expect(page).to have_content("#{@mission_2.title}")
    end
    within "#astronaut-#{@astronaut_2.id}-missions" do
      expect(page).to have_content("Missions:")
      expect(page).to have_content("#{@mission_3.title}")
    end
    within "#astronaut-#{@astronaut_3.id}-missions" do
      expect(page).to have_content("Missions:")
      expect(page).to_not have_content("#{@mission_1.title}")
      expect(page).to_not have_content("#{@mission_2.title}")
      expect(page).to_not have_content("#{@mission_3.title}")
    end
  end
end
