
require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

$crm_app_name = "Bitmaker Customer Service"
$rolodex = Rolodex.new
@@rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))


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