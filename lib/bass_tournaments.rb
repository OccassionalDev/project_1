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
  end 
    
  
  
  def invalid_input_option_error
    puts "Invalid option, please put in a valid selection."
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



