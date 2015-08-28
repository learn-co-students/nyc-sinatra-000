require 'spec_helper'

describe LandmarksController do
  before do
    landmark = Landmark.create(name: 'BQE', year_completed: '1961')
  end

  after do
    Landmark.destroy_all
  end

  it "allows you to create a new landmark" do
    visit '/new_landmark'
    fill_in "landmark name", with: "Fountain of Youth"
    fill_in "year", with: "1 AD"
    fill_in "figure name", with: "Bob"
    fill_in "title name", with: "Mr."
    choose "no"
    click_on "Create Landmark!"

    expect(page).to have_content("You created a new landmark!")

    visit '/'

    expect(page).to have_content("Fountain of Youth")
  end

  it "allows you to list all landmarks" do
    get '/'
    expect(last_response.status).to eq(200)
  end

  it "allows you to see a single landmark" do
    @landmark = Landmark.first
    get "/landmark/#{@landmark.slug}"
    expect(last_response.status).to eq(200)
  end

  it "allows you to edit a single landmark" do
    visit '/done'
    expect(page).to have_content("I can do this, but it's time I moved on.")
  end
end
