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
