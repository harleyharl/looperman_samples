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
      puts "sorry, not sure what you want, please enter a number from 1-3, or type 'exit'"
    end

  end

  # def choose_sample(input)
  #   input = gets.strip
  # end

# controls the play sequence
  def play
    input_again = nil
    until input_again == "no"
      loop do
        puts "please enter the number of the sample you'd like to listen to:"
        input = nil
        input = gets.strip.to_i
          if input < LoopermanSamples::Sample.all.size
            puts "song number #{input} is playing"
            puts "that was awesome, would you like to choose another song?"
          else
            puts "please enter a lower number"
          end
          input_again = gets.strip
      end
      goodbye
    end
  end

  # def menu
  #   input = nil
  #   while input != "exit"
  #   puts "Enter the number of the sample you'd like to dive into or type list"
  #   input = gets.strip.downcase
  #
  #    if input.to_i > 0
  #      the_sample = @samples[input.to_i-1]
  #      puts "#{i}. #{the_sample.name} - #{the_sample.artist} - #{the_sample.price}"
  #    elsif input == "list"
  #      list_samples
  #    else
  #      puts "not sure what you want, type list or exit"
  #    end
  #   end
  # end

  def goodbye
    puts "see you tomorrow for more soundpacks!"
  end


end
