# our CLI controller

class LoopermanSamples::CLI

  def call
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
      LoopermanSamples::Sample.list_samples_by_key
      $sample_list = LoopermanSamples::Sample.all.sort {|a, b| a.key <=> b.key}
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
          sample = $sample_list[input.to_i - 1]
          puts "You're listening to #{sample.title} by #{sample.creator.name}"
          puts "would you like to hear more from #{sample.creator.name}? (type yes or no)"
            input = gets.strip
            if input == "yes"
              more_samples_by_creator(sample)
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

  def more_samples_by_creator(sample)
    # sets $samples_by_creator to equal a collection of samples by given creator
    LoopermanSamples::SampleScraper.scrape_more_samples_by_creator(sample.creator)
    # displays a numbered list of those samples
    LoopermanSamples::Creator.list_all_samples_by_creator #what is this
    # sets the sample list to be used in play mode
    $sample_list = $samples_by_creator
  end



  def goodbye
    puts "see you tomorrow for more samples!"
  end


end
