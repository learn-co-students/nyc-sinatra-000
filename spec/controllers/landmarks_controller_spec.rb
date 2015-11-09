require 'spec_helper'

describe LandmarksController do
  before do
    Landmark.create(name: 'BQE', year_completed: '1961')
    Figure.create(name: 'Washington')
    Landmark.first.update(figure: Figure.first)
  end

  after do
    Landmark.destroy_all
    Figure.destroy_all
  end

  it "allows you to create a new landmark" do
    get "/landmarks/new"
    expect(last_response.status).to eq(200)
  end

  it "allows you to list all landmarks" do
    get '/landmarks'
    expect(last_response.status).to eq(200)
  end

  it "allows you to see a single landmark" do
    @landmark_id = Landmark.first.id
    get "/landmarks/#{@landmark_id}"
    expect(last_response.status).to eq(200)
  end

  it "allows you to edit a single landmark" do
    @landmark_id = Landmark.first.id
    get "/landmarks/#{@landmark_id}/edit"
    expect(last_response.status).to eq(200)
  end
end
