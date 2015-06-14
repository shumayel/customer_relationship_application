require_relative('contact.rb')

class Rolodex
  @@id = 1000

  def initialize
    @contacts = []
  end

  def add_contact(first_name, last_name, email, note)
    contact = Contact.new(@@id, first_name, last_name, email, note)
    @@id += 1

    @contacts << contact
  end

  def delete_contact(first_name, last_name, email, note)
  print "What contact would you like to delete permanently?"
  erasecontact = gets.chomp
  # @contacts.delete(erasecontact) This has to be change dsome how to_i or something.
  end

  def all
    @contacts
  end
end