require 'sinatra'
require "sinatra/reloader" if development?
require_relative 'rolodex'
require_relative 'contact'

$crm_app_name = "Bitmaker Customer Service"
$rolodex = Rolodex.new
# without this, ruby will call uninitialized class variable 
$rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))


get '/' do
	
	erb :index
end

get '/contacts' do
  #@contact = [] this was used because we didn't have a rolodex to store the data.
  # @contacts << Contact.new("Nicholas", "Altobelli", "cricket1fast@gmail.com", "Coding student")
  # @contacts << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
  # @contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")

 erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

post '/contacts' do
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	$rolodex.add_contact(new_contact)
	redirect to('/contacts')
end

get '/contacts/1000' do
  	@contacts = $rolodex.find(1000)
  	erb :show_contact
end

get "/contacts/:id" do
  	if @contact = $rolodex.find(params[:id].to_i)
  	erb :show_contact
  	  else
    raise Sinatra::NotFound
end
end





