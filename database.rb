require 'csv'

class Person
  attr_reader "name", "phone", "address", "position", "salary", "slack_acc", "github_acc"

  def initialize(name, phone, address, position, salary, slack_acc, github_acc)
    @name = name
    @phone = phone
    @address = address
    @position = position
    @salary = salary
    @slack_acc = slack_acc
    @github_acc = github_acc
  end
end

class MyDatabase
  def initialize
    @people = []
    CSV.foreach("tiy_database.csv", headers: true) do |row|
      name = row["name"]
      phone = row['phone']
      address = row["address"]
      position = row["position"]
      salary = row["salary"]
      slack_acc = row["slack_acc"]
      github_acc = row["github_acc"]

      person = Person.new(name, phone, address, position, salary, slack_acc, github_acc)

      @people << person
    end
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

    person = Person.new(name, phone, address, position, salary, slack_acc, github_acc)

    puts "You have added #{name}."
    puts "#{name}\'s phone number is #{phone}."
    puts "#{name} lives at #{address}."
    puts "Their position with the company is #{position} and they make $#{salary} a year."
    puts "Their Slack account is #{slack_acc}."
    puts "Their GitHub account is #{github_acc}.\n\n"

    @people << person
  end

  def search_for_person
    found = false
    print "Please enter the person's name: "
    search_name = gets.chomp
    @people.each do |person|
      if person.name == search_name
        found = true
        puts "#{person.name}\'s phone number is #{person.phone}, and they live at #{person.address}.  #{person.name} works as a #{person.position}, and makes $#{person.salary}\n"
      end
    end
    if found == false
      puts "That person does not exist.\n"
    end
  end

  def delete_person
    found = false
    index = 0
    print "Please enter the name of the person you want to delete: "
    delete_name = gets.chomp
    @people.each do |person|
      if person.name == delete_name
        found = true
        @people.slice!(index)
        puts "#{delete_name} has been deleted.\n"
      end
      index += 1
    end
    if found == false
      puts "That person does not exist.\n"
    end
  end

  def exit_save_database
    CSV.open("tiy_database.csv", "w") do |csv|
      csv << ["name", "phone", "address", "position", "salary", "slack_acc", "github_acc"]
      @people.each do |person|
        csv << [person.name, person.phone, person.address, person.position, person.salary, person.slack_acc, person.github_acc]
      end
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
        puts "Saving and exiting..."
        exit_save_database
      end
    end
  end
end

MyDatabase.new.start
