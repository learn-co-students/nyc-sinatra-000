class FiguresController < ApplicationController
  
  get '/figures' do
  	erb :'figures/index'
  end

  get '/figures/new' do
  	erb :'figures/new'
  end

  post '/figures/new' do
  	@figure = Figure.create(name: params[:name])
  	set_figure_titles(@figure, params[:titles])
  	erb :'figures/show'
  end

  get '/figures/:id' do
  	@figure = Figure.find(params[:id])
  	erb :'figures/show'
  end

  get '/figures/:id/edit' do
  	@figure = Figure.find(params[:id])
  	erb :'figures/edit'
  end

  post '/figures/:id/edit' do
  	@figure = Figure.find(params[:id])
  	@figure.name = params[:name]
  	set_figure_titles(@figure, params[:titles])
  	@figure.save
  	erb :'figures/show'
  end

  def set_figure_titles(figure, titles_ids)
  	figure.titles.clear
  	titles_ids.each do |id|
  	  figure.titles << Title.find(id)
  	end
  	figure.save
  end

 end