class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/new'
  end

  post '/figures' do
    figure = Figure.new(name: params[:figure][:name])

    if params[:title][:name].length > 0
      title = Title.new(name: params[:title][:name])
      figure.titles << title
    else
      figure.title_ids = params[:figure][:title_ids]
    end

    if params[:landmark][:name].length > 0
      landmark = Landmark.new(name: params[:landmark][:name])
      figure.landmarks << landmark
    else
      figure.landmark_ids = params[:figure][:landmark_ids]
    end

    figure.save

    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.name = params[:figure][:name]

    if params[:title][:name].length > 0
      title = Title.new(name: params[:title][:name])
      figure.titles << title
    else
      figure.title_ids = params[:figure][:title_ids]
    end

    if params[:landmark][:name].length > 0
      landmark = Landmark.new(name: params[:landmark][:name])
      figure.landmarks << landmark
    else
      figure.landmark_ids = params[:figure][:landmark_ids]
    end

    figure.save

    redirect "/figures/#{figure.id}"
  end

end
