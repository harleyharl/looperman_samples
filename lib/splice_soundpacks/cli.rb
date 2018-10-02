# our CLI controller 

class SpliceSoundpacks::CLI 
  
  def call 
    list_soundpacks
    menu
    goodbye
  end 
  
  def list_soundpacks
    puts "Today's Most Popular Soundpacks"
    @soundpacks = SpliceSoundpacks::Soundpack.today
    @soundpacks.each.with_index(1) do |soundpack, i| 
      puts "#{i}. #{soundpack.name} - #{soundpack.artist} - #{soundpack.price}"
    end 
  end
  
  def menu 
    input = nil 
    while input!= "exit"
    puts "Enter the number of the soundpack you'd like to dive into or type list"
    input = gets.strip.downcase
    
    if input.to_i > 0 
      puts @soundpacks[input.to_i-1]
    elsif input == "list"
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