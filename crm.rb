require 'sinatra'

get '/' do
	@crm_app_name = "Nick's CRM"
	erb :index
end

get '/contacts' do
	erb :contacts
end