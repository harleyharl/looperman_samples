# our CLI controller
require 'pry'
require_relative "../looperman_samples/concerns/findable.rb"

class LoopermanSamples::CLI

  include Concerns::Findable

  def call
    # binding.pry
    #scrapes and creates all objects
    LoopermanSamples::SampleScraper.scrape_samples #DRY up... include / extend ?
    main_menu
    play
    goodbye
  end

  def main_menu
    puts "There are 25 new samples today. how would you like to browse?"
    puts "1. browse samples by key"
    puts "2. browse samples by tempo"
    puts "3. browse samples by download count"
    input = gets.strip
    if input == "1"
      LoopermanSamples::Sample.list_samples_by_key #prints out numbered list of each sample in sample class...
      $sample_list = LoopermanSamples::Sample.all.sort {|a, b| a.key <=> b.key} #saves that list of objects in order of their key to a global variable
    elsif input == "2"
      LoopermanSamples::Sample.list_samples_by_tempo
      $sample_list = LoopermanSamples::Sample.all.sort {|a, b| b.bpm.to_i <=> a.bpm.to_i}
    elsif input == "3"
      LoopermanSamples::Sample.list_samples_by_download_count
      $sample_list = LoopermanSamples::Sample.all.sort {|a, b| b.download_count.to_i <=> a.download_count.to_i}
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
        if input.to_i < $sample_list.size + 1 && input.to_i > 0
          sample = $sample_list[input.to_i - 1] #takes user input, and sets sample variable using index lookup
          puts "You're listening to #{sample.title} by #{sample.creator.name}"
          puts "would you like to hear more from #{sample.creator.name}? (type yes or no)"
            input = gets.strip
            if input == "yes"
              find_all_by_creator(sample)
            elsif input == "no"
              main_menu
            end
          # puts "Ok!"
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
