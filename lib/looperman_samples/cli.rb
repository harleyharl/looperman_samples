# our CLI controller

class LoopermanSamples::CLI

  def call
    LoopermanSamples::SampleScraper.scrape_samples
    main_menu
    play
    goodbye
  end

  def main_menu
    puts "there are 25 new samples today. how would you like to browse?"
    puts "1. browse samples by key"
    puts "2. browse samples by tempo"
    puts "3. browse samples by download count"
    input = gets.strip
    if input == "1"
      LoopermanSamples::Sample.list_samples_by_key
    elsif input == "2"
      LoopermanSamples::Sample.list_samples_by_tempo
    elsif input == "3"
      LoopermanSamples::Sample.list_samples_by_download_count
    else
      puts "sorry, not sure what you want"
      main_menu
    end
  end

# controls the play sequence
  def play
    input = nil
      loop do
        puts "please enter the number of the sample you'd like to listen to or type exit:"
        input = gets.strip
        if input.to_i < LoopermanSamples::Sample.all.size && input.to_i > 0
          puts "song number #{input} is playing"
          puts "would you like to hear more from the creator of this sample? (type yes or no)"
            input = gets.strip
            if input == "yes"
              binding.pry
              # try using an array in the list method
              #not sure how to do this, i want to bring up the other samples by the creator of this one... but im not on a "current" sample am i
            elsif input == "no"
            end
          puts "Ok!"
        elsif input.to_i > LoopermanSamples::Sample.all.size
          puts "please enter a lower number"
        else
          break
        end
     end
  end



  def goodbye
    puts "see you tomorrow for more samples!"
  end


end
