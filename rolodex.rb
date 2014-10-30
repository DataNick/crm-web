class Rolodex
	attr_reader :contacts

	##@@index = 1000
	def initialize
		@contacts = []
		@index = 1000 #1003 for 2 rolodexes with 3 contacts.
	end

	def add_contact(contact)
		contact.id = @index
		@contacts << contact
		@index += 1
	end

	def delete_contact(id_delete)
		@contacts.delete_if{|contact| contact.id == index_delete}
	end

	def find(contact_id)
		@contacts.find {|contact| contact.id == contact_id}
	end

	def remove_contact(contact)
		@contacts.delete(contact)
	end


end