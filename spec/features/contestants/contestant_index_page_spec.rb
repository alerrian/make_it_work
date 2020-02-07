# As a visitor,
# When I visit the contestants index page ("/contestants")
# I see a list of names of all the contestants
# And under each contestants name I see a list of the projects (names) that they've been on

# (e.g.   Kentaro Kameyama
#         Projects: Litfit, Rug Tuxedo

#         Jay McCarroll
#         Projects: LeatherFeather)

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
      challenge_id: @furniture_challenge.id,
      contestant_id: @contestant1.id
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
  end

  it 'can see names of contestants on contestant index' do
    visit '/contestants'

    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant2.name)
  end
end
