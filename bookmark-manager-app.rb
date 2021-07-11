require 'sinatra'
require "sinatra/reloader" if development? # automatic code reloading

require "sinatra/activerecord"

require './models/user'

get '/' do
  erb :home
end

get '/welcome' do
  @visitor = params[:name]
  erb :home
end

# GET HTTP request
get '/signup' do
  @visitor = params[:name]
  erb :signup
end

get '/all_users' do
  @users = User.all
  erb :all_users
end
# note:
# @users = in order to read the database from the users table in dbeaver, we use activerecord models user
# User = we call the acvtiverecord model user
# .all = this is the class method

# POST HTTP request
post '/signup' do   # once I press submit, all the information of the form will go into the post
  user = User.new(full_name: params[:full_name], email: params[:email]) # we can refer the information from the schema migration
  # user = create a variable 'user'
  # User.new() = since we already require the models user, we use User.new() to create new user
  #full_name: params[:full_name] = we pass in the information from the form, information from the form goes into params. The name of the params can check in the form so we can access it
  #email: params[:email] = # same as full_name: params[:full_name]
  # note-- above code will create a new user object in memory, so it is not in database yet, to actually save it refer below code if statement

 # if user is successfully saved
if user.save          # ask daniel: why we dont need to define the erb signup?
  redirect 'all_users'
else
  'Unable to save user information'
end
end
