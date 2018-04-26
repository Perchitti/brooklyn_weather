  class BrooklynWeather::CLI

    def intro
      puts ""
      puts "              Welcome to Brooklyn Weather"
      current
      day
    end

    def current
      @current_temp = BrooklynWeather::Scraper.current_scraper
        puts "            The current temperature is #{@current_temp}"
        puts ""
    end

    def weather
      @weather = Brooklyn::Scraper.forecast
      @weather.each |temp|
      puts "???????"
    end


    def day
      puts "Would you like to see the forecast for 'today' or 'tomorrow'?"
      puts "Gotta go? Type 'exit'."
      puts ""
      #still figuring this part out
      input = gets.strip.downcase
        case input
        when "today"
          puts "Today's forecast:"
        when "tomorrow"
          puts "Tomorrow's forecast:"
        when "exit"
          exit
        else
          day
        end
      end


  def exit
    puts ""
    puts "    'Spread love, it's the Brooklyn way.' - Notorious B.I.G"
    puts ""
    puts "                       Goodbye!  "
    puts ""
  end


end
