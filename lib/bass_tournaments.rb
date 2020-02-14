require "nokogiri"
require "open-uri"

class CLI

  def start 
    Scraper.new.scrape_tournaments
    puts "Hello! Welcome to the Bassmaster Tournament app."
    main_menu
  end 
  
  def main_menu
    puts "Which option would you like to proceed with?"
    puts ""
    puts "1. List all tournaments"
    puts "2. Exit"
    puts ""
    
    print "Selection: "
    input = gets.strip
    
    case input
      when "1"
        list_tournaments
      
      when "2"
        exiting_program_message
        
      else 
        invalid_input_option_error
        main_menu
    end 
  end 
  
  def list_tournaments
    puts ""
    
    Tournament.all.each_with_index do |tournament, index|
      if index != 0
        puts "#{index.to_s}. #{tournament.name}"
      end 
    end
    
    list_tournament_menu
  end 
  
  def list_tournament_menu
    puts "" 
    puts "Select one of the following options below to proceed:"
    puts "" 
    puts "1. Select a tournament to get more information about"
    puts "2. Return to the main menu"
    puts "3. Exit the program"
    puts ""
    
    print "Selection: "
    input = gets.strip 
    
    case input 
      when "1"
        select_tournament_menu
        
      when "2"
        main_menu
        
      when "3"
        exiting_program_message
        
      else 
        invalid_input_option_error
        list_tournament_menu
    end 
  end 
  
  def select_tournament_menu
    puts ""
    puts "Please enter a number from the list to get more information about the selected tournament: "
    puts ""
    print "Selection: "
    
    index = gets.strip.to_i 
    
    if index > (Tournament.all.count-1) || index < 1 
      invalid_input_tournament_information_selection
      select_tournament_menu
    end 
    
    puts ""
    display_tournament_info(index)
  end 
  
  def display_tournament_info(index)
    tournament = Tournament.all[index]
    
    tournament.info 
    
    display_tournament_menu
  end 
  
  def display_tournament_menu
    puts ""
    puts "What would you like to do now?"
    puts "1. Return to the tournament list"
    puts "2. Return to the main menu"
    puts "3. Exit the program"
    puts ""
    print "Selection: "
    
    input = gets.strip 
    
    case input 
      when "1"
        list_tournaments
        
      when "2"
        main_menu
        
      when "3"
        exiting_program_message
        
      else 
        invalid_input_option_error
        display_tournament_menu
    end 
  end 
    
  def invalid_input_option_error
    puts "Invalid option, please put in a valid selection."
  end 
  
  def invalid_input_tournament_information_selection
    puts "Invalid input. Please put in values for a tournament between 1 and #{(Tournament.all.count-1).to_s}"
  end 
    
  def exiting_program_message
    puts "Thank you, now exiting the program."
  end 
end 

class Tournament 
  attr_accessor :name, :date, :series, :location 
  
  @@all = [] 
  
  def create_from_array(array)
    new_tournament = Tournament.new
    
    new_tournament.series = array[0]
    new_tournament.name = array[1]
    new_tournament.location = array[2]
    new_tournament.date = array[3]
    
    new_tournament.save
  end 
  
  def self.all 
    @@all 
  end 
  
  def save 
    @@all << self 
  end 
  
  def info 
    puts "Tournament Name: #{name}"
    puts "Series: #{series}"
    puts "Location: #{location}"
    puts "Date(s) when the tournament takes place: #{date}"
  end 
end 

class Scraper
  
  def scrape_tournaments 
    tournament_table_data = create_array_of_table_text
    
    tournament_table_data.each do |table_row_data|
      Tournament.new.create_from_array(table_row_data)
    end 
  end 
  
  def create_array_of_table_text
    doc = Nokogiri::HTML(open("https://www.bassmaster.com/bassmaster-tournament-schedule"))
    
    # Grab the table from the website
    tournament_table = doc.css("table.views-table.cols-5.table.table-striped.table-bordered")
    
    # Store all the rows in to a variable 
    table_rows = tournament_table.css("tr")
    
    # Store the text from the rows in a nested array 
    # [[first row data], [second row data]]
    
    all_text_from_table = table_rows.collect do |row|
      
      # Go through each of the rows and collect the data as text and store it as a array
      row_text = row.css("td").collect { |data| data.text.strip }
      
      # Place the new array in to the array 
      [*row_text]
    end 
    
    # Return the nested array 
    all_text_from_table
  end 
end 

CLI.new.start



