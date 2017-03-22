class MyDatabase
  attr_reader "name", "phone", "address", "position", "salary", "slack_acc", "github_acc"

  def initialize
    @entries = []
    @name = name
    @phone = phone
    @address = address
    @position = position
    @salary = salary
    @slack_acc = slack_acc
    @github_acc = github_acc
  end

  def ask_question
    puts "What would you like to do?"
    puts "A to Add a person"
    puts "S to Search for a person"
    puts "D to Delete a person"
    puts "Or just press enter to exit."
    choice = gets.chomp
    return choice
  end

  def add_person
    entry = []

    puts "What is the person's name?"
    name = gets.chomp

    if name.empty?
      puts "Name can not be blank"
    end

    puts "What is their phone number?"
    phone = gets.chomp

    puts "What is their address?"
    address = gets.chomp

    puts "What is their position?"
    position = gets.chomp

    puts "What is their salary?"
    salary = gets.chomp.to_i

    puts "What is their Slack account?"
    slack_acc = gets.chomp

    puts "What is their GitHub account?"
    github_acc = gets.chomp

    entry = [name, phone, address, position, salary, slack_acc, github_acc]

    puts "You have added #{name}."
    puts "#{name}\'s phone number is #{phone}."
    puts "#{name} lives at #{address}."
    puts "Their position with the company is #{position} and they make $#{salary} a year."
    puts "Their Slack account is #{slack_acc}."
    puts "Their GitHub account is #{github_acc}.\n\n"

    @entries << entry
  end

  def search_for_person
    print "Please enter the person's name: "
    search_name = gets.chomp
    if @entries.include?(search_name)

    else
      "That person does not exist."
    end

    puts "#{name}\'s phone number is #{phone}, and they live at #{address}.  #{name} works as a #{postion}, and makes $#{salary}"
  end

  def delete_person
    print "Please enter the name of the person you want to delete: "
    delete_name = gets.chomp
    if @entries.include?(search_name)

    else
      "That person does not exist."
    end
  end

  def start
    choice = ()
    while choice != ""
      choice = ask_question
      if choice == "A"
        add_person
      elsif choice == "S"
        search_for_person
      elsif choice == "D"
        delete_person
      else
        puts "Exiting..."
      end
    end
  end
end

MyDatabase.new.start
