class TitlesController < ApplicationController
  
  get '/titles' do
  	erb :'titles/index'
  end

  get '/titles/new' do
  	erb :'titles/new'
  end

  post '/titles/new' do
  	@title = Title.create(name: params[:name])
  	set_title_figures(@title, params[:figures])
  	erb :'titles/show'
  end

  get '/titles/:id' do
  	@title = Title.find(params[:id])
  	erb :'titles/show'
  end

  get '/titles/:id/edit' do
  	@title = Title.find(params[:id])
  	erb :'titles/edit'
  end

  post '/titles/:id/edit' do
  	@title = Title.find(params[:id])
  	@title.name = params[:name]
  	set_title_figures(@title, params[:figures])
  	@title.save
  	erb :'titles/show'
  end

  def set_title_figures(title, figures_ids)
  	title.figures.clear
  	figures_ids.each do |id|
  	  title.figures << Figure.find(id)
  	end
  	title.save
  end
  	
end