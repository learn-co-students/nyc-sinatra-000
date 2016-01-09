### redundancy of landmark name inputs for capybara again, it can't find :landmark_name as id for input named landmark[name], strangely though it can do this for year completed

class LandmarksController < ApplicationController

  get '/landmarks' do


    erb :'landmarks/index'
  end

  get '/landmarks/new' do

    erb :'landmarks/new'
  end

  post '/landmarks/new' do
    new_landmark = Landmark.new.tap{|t|
      t.name = params[:landmark_name]
      t.year_completed = params[:landmark][:year_completed]
    }
    new_landmark.save

    redirect to("/landmarks/#{new_landmark.id}")
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    ###what is going on with the splats and captures coming through?

    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    ###what is going on with the splats and captures coming through?

    erb :'landmarks/edit'
  end

  post '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    @landmark.name = params[:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save

    redirect to("/landmarks/#{@landmark.id}")
  end

end
