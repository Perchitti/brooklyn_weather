  class BrooklynWeather::CLI

    def intro
      puts ""
      puts "              Welcome to Brooklyn Weather"
      current
      scrape_data
      day
    end

    def scrape_data
       BrooklynWeather::Scraper.scrape_today
       BrooklynWeather::Scraper.scrape_tomorrow
    end

    def current
      @current_temp ||= BrooklynWeather::Scraper.current_scraper
        puts "            The current temperature is #{@current_temp.slice(0..3)}"
        puts ""
    end
#  end


    def day
        puts ""
        puts "Would you like to see the forecast for 'today' or 'tomorrow'?"
        # puts "or, would you like to see a future forecast - enter the number of days past today"
        puts "Gotta go? Type 'exit'."
        puts ""
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
      @weather = BrooklynWeather::Forecast.all[0]
      #@weather = BrooklynWeather::Scraper.scrape_today
        puts ""
        puts "#{@weather.name}"
        puts "#{@weather.description}"
        puts "High: #{@weather.high} F"
        puts "Low: #{@weather.low} F"
        puts "Tonight: #{@weather.tonight}"
      end

      def tomorrow_weather
        @weather = BrooklynWeather::Forecast.all[1]
        #@weather = BrooklynWeather::Scraper.scrape_tomorrow
          puts ""
          puts "#{@weather.name}"
          puts "#{@weather.description}"
          puts "High: #{@weather.high}F"
          puts "Low: #{@weather.low.slice!(1..-1)}"
          puts "Night: #{@weather.tonight}"
        end

        # def show_by_number(date)
        #  #  weather = [find or scrape]

        # end


      def exit
        puts ""
        puts "    'Spread love, it's the Brooklyn way.' - Notorious B.I.G"
        puts ""
        puts "                       Goodbye!  "
        puts ""
      end


end
