class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(:id => params[:id])
    erb :'landmarks/show'
  end

  post '/landmarks' do
      @landmark = Landmark.create(:name => params["landmark"]["name"], :year_completed => params["landmark"]["year_completed"])
      @landmark.figure_id = Figure.find_by(:name => params["landmark"]["figure_name"])
      @landmark.save
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(:id => params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by(:id => params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect("/landmarks/#{@landmark.id}")
  end
end
