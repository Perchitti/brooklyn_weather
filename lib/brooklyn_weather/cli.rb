  class BrooklynWeather::CLI

    def intro
      puts ""
      puts "              Welcome to Brooklyn Weather"
      current
      day
    end

#def testing_scrape
#  @day = BrooklynWeather::Scraper.forecast
#  @day.each do |temp|
#    puts temp
#  end
#end

    def current
      @current_temp = BrooklynWeather::Scraper.current_scraper
        puts "            The current temperature is #{@current_temp}"
        puts ""
    end
#  end


    def day
      puts ""
      puts "Would you like to see the forecast for 'today' or 'tomorrow'?"
      puts "Gotta go? Type 'exit'."
      puts ""
      #still figuring this part out
      input = gets.strip.downcase
        case input
        when "today"
          today_weather
          day
        when "tomorrow"
          tomorrow_weather
          day
        when "exit"
          exit
        else
          day
        end
      end


    def today_weather
      @weather = BrooklynWeather::Scraper.scrape_today
        puts ""
        puts "#{@weather.name}"
        puts "#{@weather.description}"
        puts "High:#{@weather.high}F"
        puts "Low:#{@weather.low.slice!(1..-1)}"
        puts "Tonight: #{@weather.tonight}"
      end

      def tomorrow_weather
        @weather = BrooklynWeather::Scraper.scrape_tomorrow
          puts ""
          puts "#{@weather.name}"
          puts "#{@weather.description}"
          puts "High: #{@weather.high}F"
          puts "Low: #{@weather.low.slice!(1..-1)}"
          puts "Tonight: #{@weather.tonight}"
        end


      def exit
        puts ""
        puts "    'Spread love, it's the Brooklyn way.' - Notorious B.I.G"
        puts ""
        puts "                       Goodbye!  "
        puts ""
      end


end
