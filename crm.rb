
require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

$crm_app_name = "Nick's CRM"
$rolodex = Rolodex.new
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
