require_relative 'contact'
require 'sinatra'

$crm_app_name = "Nick's CRM"

get '/' do
	
	erb :index
end

get '/contacts' do
  @contact = []
  @contact << Contact.new("Nicholas", "Altobelli", "cricket1fast@gmail.com", "Coding student")
  @contact << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
  @contact << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")

 erb :contacts
end