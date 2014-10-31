require_relative 'rolodex'

require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

# require "sinatra/reloader" if development?

$crm_app_name = "Bitmaker Customer Service"
$rolodex = Rolodex.new
# without this, ruby will call uninitialized class variable 

class Contact
  include DataMapper::Resource

    property :id, Serial
    property :first_name, String
    property :last_name, String
    property :email, String
    property :note, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

  # attr_accessor :id, :first_name, :last_name, :email, :note
  # def initialize(first_name, last_name, email, note)
  #   @first_name = first_name
  #   @last_name = last_name
  #   @email = email
  #   @note = note    
#end


get '/' do
	
	erb :index
end

get '/contacts' do
 @contacts = Contact.all
 erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end


post "/contacts" do
  contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :note => params[:note]
  )
  redirect to('/contacts')
end


# post '/contacts' do
# 	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
# 	$rolodex.add_contact(new_contact)
# 	redirect to('/contacts')
# end

get '/contacts/1000' do
  	@contact = $rolodex.find(1000)
  	erb :show_contact
end

get "/contacts/:id" do
	if @contact = $rolodex.find(params[:id].to_i)
  		erb :show_contact
  	else
    	raise Sinatra::NotFound
	end
end

get "/contacts/:id/edit" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end

 delete "/contacts/:id" do
  	@contact = $rolodex.find(params[:id].to_i)
  if @contact
  		$rolodex.remove_contact(@contact)
  		redirect to ("/contacts")
  else
  	raise Sinatra::NotFound
  	end
  end

end




