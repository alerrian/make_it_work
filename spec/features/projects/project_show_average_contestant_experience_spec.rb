require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before :each do
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
  end

  it 'can see number of contestants on project show page' do
    visit "/projects/#{@project.id}"

    expect(page).to have_content(@project.name)
    expect(page).to have_content(@project.material)
    expect(page).to have_content(@furniture_challenge.theme)
    expect(page).to have_content('Average Experience: 5')
  end
end
