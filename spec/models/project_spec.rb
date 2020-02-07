require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  it "Can get count of all contestants" do
    @furniture_challenge = Challenge.create(
      theme: "Apartment Furnishings",
      project_budget: 1000)

    @project = Project.create(
      name: "Litfit",
      material: "Lamp",
      challenge_id: @furniture_challenge.id)
      @furniture_challenge = Challenge.create!(
        theme: "Apartment Furnishings",
        project_budget: 1000
      )
  
      @project = Project.create!(
        name: "Litfit",
        material: "Lamp",
        challenge_id: @furniture_challenge.id
      )
  
      @contestant1 = Contestant.create!(
        name: 'Steve',
        age: 32,
        hometown: 'Colorado Springs',
        years_of_experience: 5
      )
  
      @contestant2 = Contestant.create!(
        name: 'Cass',
        age: 30,
        hometown: 'Colorado Springs',
        years_of_experience: 10
      )
  
      @contestant_project = ContestantProject.create!(
        contestant_id: @contestant1.id,
        project_id: @project.id
      )

    expect(@project.contestant_count).to eq(1)
    expect(@project.average_experience).to eq(5)
  end
end
