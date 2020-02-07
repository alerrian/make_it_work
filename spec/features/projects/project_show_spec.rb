# User Story 1 of 4

# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)

require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  before :each do
    @furniture_challenge = Challenge.create(
      theme: "Apartment Furnishings",
      project_budget: 1000)

    @project = Project.create(
      name: "Litfit",
      material: "Lamp",
      challenge_id: @furniture_challenge.id)
  end

  it 'can see information about the project' do
    visit "/projects/#{@project.id}"

    expect(page).to have_content(@project.name)
    expect(page).to have_content(@project.material)
    expect(page).to have_content(@furniture_challenge.theme)
  end

end

