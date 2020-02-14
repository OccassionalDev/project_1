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
    puts "Date(s): #{date}"
  end 
end 