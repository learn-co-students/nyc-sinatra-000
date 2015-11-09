class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
  	erb :'landmarks/new'
  end

  post '/landmarks/new' do
  	figure_data = params[:figure]
  	figure = Figure.find_by(name: figure_data[:name])
    if !figure 
      figure = Figure.create(name: figure_data[:name])
 	  set_figure_titles(figure, figure_data[:titles])
 	end  
  	@landmark = Landmark.create(name: params[:name], year_completed: params[:year_completed], figure: figure)
    erb :'landmarks/show'
  end

  get '/landmarks/:id' do
  	@landmark = Landmark.find(params[:id])
  	erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
  	@landmark = Landmark.find(params[:id])
  	erb :'landmarks/edit'
  end

  post '/landmarks/:id/edit' do
  	figure_data = params[:figure]
  	figure = Figure.find_by(name: figure_data[:name])
    figure ||= Figure.create(name: figure_data[:name])
 	set_figure_titles(figure, figure_data[:titles]) 
  	@landmark = Landmark.find(params[:id])
  	@landmark.update(name: params[:name], year_completed: params[:year_completed], figure: figure)
  	erb :'landmarks/show'
  end

  def set_figure_titles(figure, titles_ids)
  	figure.titles.clear
  	titles_ids.each do |id|
  	  figure.titles << Title.find(id)
  	end
  	figure.save
  end

end
