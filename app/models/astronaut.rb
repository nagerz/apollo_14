class Astronaut < ApplicationRecord
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  validates_presence_of :name, :age, :job

  def self.average_age
    average(:age)
  end

  def space_time
    self.missions.sum(:time_in_space)
  end
end
