class FiguresController < ApplicationController
  get '/figures' do
   @figures = Figure.all
   erb :'figures/index'
 end

 get '/figures/new' do
   erb :'figures/new'
 end

 get '/figures/:id' do
   @figure = Figure.find_by(:id => params[:id])
   erb :'figures/show'
 end

 post '/figures' do
     puts "==+==+==+==+==+=="
     puts params

    figure = Figure.create(:name => params["figure"]["name"])

    if (params["figure"]["title_ids"])
      params["figure"]["title_ids"].each do |id|
        title = Title.find_by(:id => id)
        figure.titles << title
      end
    end

    if(params["figure"]["landmark_ids"])
      params["figure"]["landmark_ids"].each do |id|
        landmark = Landmark.find_by(:id => id)
        figure.landmarks << landmark
      end
    end

    if(params["title"]["name"]!= "")
      title = Title.create(:name => params["title"]["name"])
      figure.titles << title
    end

    if(params["landmark"]["name"]!= "")
      landmark = Landmark.create(:name => params["landmark"]["name"])
      figure.landmarks << landmark
    end

    figure.save
 end

 get '/figures/:id/edit' do
   @figure = Figure.find_by(:id => params[:id])
   erb :'/figures/edit'
 end

 patch '/figures/:id' do
   @figure = Figure.find_by(:id => params[:id])
   @figure.update(params[:figure])
   if(params["landmark"]["name"]!="")
     landmark = Figure.create(:name => params["landmark"]["name"])
     @figure.landmarks << landmark
   end
   @figure.save
   redirect("/figures/#{@figure.id}")
 end
end
