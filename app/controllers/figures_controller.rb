class FiguresController < ApplicationController
  # add controller methods


  get '/figures' do 
  	@figures = Figure.all 
  	erb :'/figures/index'
  end

  get '/figures/new' do 
  	@landmarks = Landmark.all 
  	@titles = Title.all
  	erb :'/figures/new'
  end

  get '/figures/:id' do 
  	@figure = Figure.find(params[:id])
  	erb :'/figures/show'
  end

  post '/figures' do 

  	@figure = Figure.create(params[:figure])
  	if !params[:landmark][:name].empty?
  		@figure.landmarks << Landmark.create(name: params[:landmark]["name"])
  	end
  	if !params[:title][:name].empty?
  		@figure.titles << Title.create(name: params[:title]["name"])
  	end


  	redirect "/figures/#{@figure.id}"
  end


  get '/figures/:id/edit' do 
  	@figure = Figure.find(params[:id])
  	@titles = Title.all 
  	@landmarks = Landmark.all 
  	erb :'/figures/edit'
  end 


  post '/figures/:id' do 
  	@figure = Figure.find(params[:id])
  	@figure.update(params[:figure])
	if !params[:landmark][:name].empty?
  		@figure.landmarks << Landmark.create(name: params[:landmark]["name"])
  	end
  	if !params[:title][:name].empty?
  		@figure.titles << Title.create(name: params[:title]["name"])
  	end


  	redirect "figures/#{@figure.id}"
  end





end
