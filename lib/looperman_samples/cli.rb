# our CLI controller

class LoopermanSamples::CLI

  def call
    scrape_samples
    create_sample_objects
    list_samples
    menu
    play something
    goodbye
  end

  def list_samples
    puts "Today's Most Popular Samples"
    @samples = LoopermanSamples::Sample.today
    @samples.each.with_index(1) do |sample, i|
      puts "#{i}. #{sample.name} - #{sample.artist} - #{sample.price}"
    end
  end

  def menu
    input = nil
    while input!= "exit"
    puts "Enter the number of the sample you'd like to dive into or type list"
    input = gets.strip.downcase

     if input.to_i > 0
       the_sample = @samples[input.to_i-1]
       puts "#{i}. #{the_sample.name} - #{the_sample.artist} - #{the_sample.price}"
     elsif input == "list"
       list_samples
     else
       puts "not sure what you want, type list or exit"
     end
    end
  end

  def goodbye
    puts "see you tomorrow for more soundpacks!"
  end


end
