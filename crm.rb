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
    puts "[3] Display an attribute"
    puts "[4] Display all contacts"
    puts "[5] Display a specific contact"
    puts "[6] Delete a contact"
    puts "[7] Exit"
  end

  def choose_option(choice)
    case choice
    when 1 then add_contact
    when 2 then edit_contact_choice
    when 3 then display_attribute
    when 4 then display_contacts
    when 5 then display_a_contact
    when 6 then delete_contact
    when 7
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


  def edit_contact_choice
    puts "Are you sure you want to continue? Y/N."
    selection = gets.chomp
    if selection == "Y"
      puts "Which ID would you like to edit?"
      whichid = gets.chomp
      contact_to_edit = @rolodex.find_contact(whichid)
      puts "Please enter the attribute you wish to modify."
      attribute = gets.chomp
      puts "Please enter the new value."
      new_value = gets.chomp
      # contact_to_edit.first_name = new_first_name
      contact_to_edit.update(attribute, new_value)
      puts contact_to_edit.inspect
    elsif selection == "N"
      puts "Cancelling selection."
      main_menu
    else
      "Please put Y or N only, in capital letters please."
    end
  end

  def delete_contact
    print "What contact ID would you like to delete permanently?"
    whichid = gets.chomp
    @rolodex.delete_contact(whichid)
    puts "Contact deleted."
  end

  def run_edit_choice
    print "Please enter new values for First Name, Last Name, E-mail, and Note."
    @rolodex.add_contact(first_name, last_name, email, notes)
    puts "The contact has been added."
  end

  def display_contacts
    @rolodex.all.each do |contact|
      puts "#{contact.first_name} #{contact.last_name}"
    end
  end

  def display_a_contact
    puts "Which ID would you like to display?"
    whichid = gets.chomp
    contact = @rolodex.find_contact(whichid)
    puts contact.inspect
  end

  def display_attribute
    puts "Which attribute category would you like to organize the contacts by? First Name? Last Name? E-mail? Notes? Please be specific when entering value."
    category = gets.chomp
    puts @rolodex.display_by_attribute(category)
  end

end


CRM.run("Bitmaker CRM")

CRM.run

bitmaker_crm = CRM.new("Bitmaker CRM")
personal_crm = CRM.new("Personal CRM")

bm_name = bitmaker_crm.name("Shumayel", "Khan")