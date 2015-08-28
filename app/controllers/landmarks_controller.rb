class LandmarksController < ApplicationController

	get '/' do
		@landmarks = Landmark.all
		erb :'landmarks/index'
	end

	get '/landmark/:slug' do
		@landmark = Landmark.find_by_slug(params[:slug])
		erb :'landmarks/show'
  end

  get '/new_landmark' do
  	erb :'landmarks/new'
  end

  post '/new_landmark' do
  	landmark_name = params["landmark name"]
  	year_completed = params["year"]
  	figure_name = params["figure name"]
  	title_name = params["title name"]
  	landmark = Landmark.create(name: landmark_name, year_completed: year_completed)
  	title = Title.find_or_create_by(name: title_name)
  	figure = Figure.find_or_create_by(name: figure_name)
  	unless figure.titles.include?(title)
  	  figure.titles << title
  	end
		landmark.figure = figure
		landmark.save
  	if params["yes or no"] == "yes"
  		redirect '/more_titles'
  	end
  	erb :'landmarks/success'
  end

  get '/more_titles' do
  	@figure = Figure.all.last
  	erb :'landmarks/more_titles'
  end

  post '/more_titles' do
  	title = params["title name"]
  	@title = Title.find_or_create_by(name: title)
  	@figure = Figure.all.last
  	unless @figure.titles.include?(@title)
  	  @figure.titles << @title
  	end
  	@figure.save
  	if params["yes or no"] == "yes"
  		redirect '/more_titles'
  	end
  	erb :'landmarks/success'
  end

  get '/edit_landmark' do
    erb :'landmarks/edit'
  end

  post '/edit_landmark' do
    @landmark_name = params.key("on")
    @landmark = Landmark.find_by_name(@landmark_name)
    erb :'landmarks/editting'
  end

  get '/done' do
    erb :'doneso'
  end

end
