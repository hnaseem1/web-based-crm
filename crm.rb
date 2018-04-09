require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/:id' do
  # params[:id] contains the id from the URL
  @contact = Contact.find_by({id: params[:id].to_i})
  erb :show_contact
end

after do
  ActiveRecord::Base.connection.close
end
