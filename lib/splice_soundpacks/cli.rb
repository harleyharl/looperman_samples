# our CLI controller 

class SpliceSoundpacks::CLI 
  
  def call 
    list_soundpacks
    menu
  end 
  
  def list_soundpacks
    puts "Today's Most Popular Soundpacks"
    puts <<-DOC
    1. lex luger - 808s and kicks - May 2016
    2. KASHMR - dance anthems 2018 - March 2018
    3. Aphex Twin - Psychadelic Drums - December 1999
    DOC
  end
  
  def menu 
    puts "Enter the number of the soundpack you'd like to dive into"
    while input!= "exit"
    input = gets.strip.downcase
    
    case input 
    when "1"
      puts "More info on pack 1"
    when "2"
      puts "More info on pack 2"
    when "3"
      puts "More info on pack 3"
    end 
  end 
  end 
  

end 