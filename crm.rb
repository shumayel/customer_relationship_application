require_relative('rolodex.rb')

class CRM
  attr_reader :name

  def self.run(name)
    my_crm = CRM.new(name)
    my_crm.main_menu
  end

  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Display all contacts"
    puts "[4] Display an attribute"
    puts "[5] Delete a contact"
    puts "[6] Exit"
  end

  def choose_option(choice)
    case choice
    when 1 then add_contact
    when 2 then edit_contact
    when 3 then display_contacts
    when 4 then display_attribute
    when 5 then delete_contact
    when 6
      puts "Goodbye"
      exit
    else
      puts "I'm sorry Dave, I'm afraid I can't do that."
    end
  end

  def main_menu
    puts "Welcome to #{@name}"
    while true
      print_main_menu

      print "Select an option:"
      input = gets.chomp.to_i

      # return if input == 6

      choose_option(input)
    end
  end

  def add_contact
    puts "Adding a contact"

    print "First name: "
    first_name = gets.chomp

    print "Last name: "
    last_name = gets.chomp

    print "Email: "
    email = gets.chomp

    print "Notes: "
    notes = gets.chomp

    @rolodex.add_contact(first_name, last_name, email, notes)
  end

  def edit_contact
    puts "Which attribute would you like to edit?"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] E-mail"
    puts "[4] Notes"
    puts "[5] Back to Main Menu"
  end

  def edit_contact_choice(attribute_edit)
    case attribute_edit
    when 1 then edit_first_name
    when 2 then edit_last_name
    when 3 then edit_email
    when 4 then edit_notes
    when 5 then main_menu
      else
        puts "Dave, you don't know what you're doing."
      end
  end

  def display_contacts
    @rolodex.all.each do |contact|
      puts "#{contact.first_name} #{contact.last_name}"
    end
  end

  def display_attribute
    @rolodex.all.each do |contact|
      puts "#{contact.email}, #{contact.notes}"
    end
  end

  def delete_contact
    puts "Which contact would you like to delete? Please write first and last name."
    nametodelete = gets.chomp
****FINISH THIS***
  end
end

CRM.run("Bitmaker CRM")

# CRM.run

# bitmaker_crm = CRM.new("Bitmaker CRM")
# personal_crm = CRM.new("Personal CRM")

# bm_name = bitmaker_crm.name