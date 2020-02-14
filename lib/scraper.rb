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