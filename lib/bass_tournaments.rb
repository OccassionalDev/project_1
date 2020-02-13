class CLI

  def start 
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
        puts "working"
      
      when "2"
        exiting_program_message
        
      else 
        puts "Invalid option, please put in a valid selection."
    end 
  end 
  
  def exiting_program_message
    puts "Thank you, now exiting the program."
  end 
end 

class Scraper


end 

CLI.new.start



