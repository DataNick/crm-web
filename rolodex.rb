class Rolodex
	attr_reader :contacts

	@@index = 1000
	def initialize
		@contacts = []
		@index = 1000 #1003 for 2 rolodexes with 3 contacts.
	end

	def add_contact(contact)
		contact.id = @@index
		@@index += 1
		@contacts << contact
	end

	def delete_contact(id_delete)
		@contacts.delete_if{|contact| contact.id == id_delete}
	end

	def find(contact_id)
		@contacts.each {|contact| contact.id == contact_id}
		
	end

end