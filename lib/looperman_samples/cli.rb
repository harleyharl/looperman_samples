# our CLI controller
require 'pry'
require_relative "../looperman_samples/concerns/cli_methods.rb"

class LoopermanSamples::CLI

  include CliMethods::Findable
  include CliMethods::Scrapeable
  include CliMethods::Listable

  @@sample_list = []

  def call
    scrape
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
      list_by_key #prints list and sets @@sample_list variable
      @@sample_list = LoopermanSamples::Sample.all.sort {|a, b| a.key <=> b.key}
    elsif input == "2"
      list_by_tempo #prints list and sets $sample_list variable
      @@sample_list = LoopermanSamples::Sample.all.sort {|a, b| b.bpm.to_i <=> a.bpm.to_i}
    elsif input == "3"
      list_by_downloads #prints list and sets $sample_list variable
      @@sample_list = LoopermanSamples::Sample.all.sort {|a, b| b.download_count.to_i <=> a.download_count.to_i}
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
        if input.to_i < @@sample_list.size + 1 && input.to_i > 0 #checks that input is greater than zero and less than list size
          sample = @@sample_list[input.to_i - 1] #takes user input, and sets sample variable using index lookup
          puts "You're listening to #{sample.title} by #{sample.creator.name}"

          puts "would you like to hear more from #{sample.creator.name}? (type yes or no)"
            input = gets.strip
            if input == "yes"
              sample_objects = find_all_by_creator(sample)
              list_all_samples_by_creator(sample_objects)
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
