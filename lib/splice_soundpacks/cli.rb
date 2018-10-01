# our CLI controller 

class SpliceSoundpacks::CLI 
  
  def call 
    list_soundpacks
    menu
    goodbye
  end 
  
  def list_soundpacks
    puts "Today's Most Popular Soundpacks"
    @deal = SpliceSoundpacks::Soundpack.today
  end
  
  def menu 
    input = nil 
    while input!= "exit"
    puts "Enter the number of the soundpack you'd like to dive into or type list"
    input = gets.strip.downcase
    case input 
    when "1"
      puts "More info on pack 1"
    when "2"
      puts "More info on pack 2"
    when "3"
      puts "More info on pack 3"
    when "list"
      list_soundpacks
    else 
      puts "not sure what you want, type list or exit"
    end 
  end 
  end 
  
  def goodbye
    puts "see you tomorrow for more soundpacks!"
  end 
  

end 