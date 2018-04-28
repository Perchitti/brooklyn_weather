

class BrooklynWeather::Scraper

attr_accessor :high, :low, :description, :name, :tonight

  #def self.forecast
  #  self.scrape
    #bring up in 1on1. How do I utilize this method within the CLI?
    #How can I loop through this?
  #end


#  def self.scrape
  #  weather = []
  #    weather << self.scrape_today
  #    weather << self.scrape_tomorrow
  #  weather
#  end

#https://www.accuweather.com/en/us/brooklyn-ny/11210/weather-forecast/334651


  def self.scrape_today
    doc = Nokogiri::HTML(open("https://www.accuweather.com/en/us/brooklyn-ny/11210/daily-weather-forecast/334651?day=1"
      ))
      today_temp = self.new
      @name = today_temp.name = doc.search(".clearfix h3.lt time").text.strip
      @high = today_temp.high = doc.search("#detail-day-night .day span.large-temp").text.strip
      @low = today_temp.low = doc.search("#detail-day-night .night span.large-temp").text.strip
      @description = today_temp.description = doc.search("#detail-day-night .day .cond").text.strip
      @tonight = today_temp.tonight = doc.search("#detail-day-night .night .cond").text.strip
      today_temp
    end


    def self.scrape_tomorrow
      doc = Nokogiri::HTML(open("https://www.accuweather.com/en/us/brooklyn-ny/11210/daily-weather-forecast/334651?day=2"
        ))
      tomorrow_temp = self.new
      @name = tomorrow_temp.name = doc.search("li.day.fday2.current.cl h4").text.strip
      @high = tomorrow_temp.high = doc.search("li.day.fday2.current.cl span.large-temp").text.strip
      @low = tomorrow_temp.low = doc.search("li.day.fday2.current.cl span.small-temp").text.strip
      @description = tomorrow_temp.description = doc.search("li.day.fday2.current.cl span.cond").text.strip
      @tonight = tomorrow_temp.tonight = doc.search("#detail-day-night .night .cond").text.strip
      tomorrow_temp
    end


    def self.current_scraper
      doc = Nokogiri::HTML(open("https://www.accuweather.com/en/us/brooklyn-ny/11210/daily-weather-forecast/334651?day=1"
        ))
        current_temp = doc.search("#current-city-tab span.local-temp").text.strip
      end


end


#Could something like this work for scrape_today?
#doc.search(".bg.bg-r").collect do |today|
#  today_info={
#    :name => today.search("h4").text
#    :high => today.search("span.large_temp").text.strip
    #:low => today.search
#    :description => today.search("span.cond").text.strip
#  }
#  today_info
