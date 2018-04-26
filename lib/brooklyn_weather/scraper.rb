

class BrooklynWeather::Scraper

attr_accessor :high, :low, :description, :name, :feel

  def self.forecast
    self.scrape
    #bring up in 1on1. How do I utilize this method within the CLI?
    #How can I loop through this?
  end


  def self.scrape
    weather = []
      weather << self.scrape_today
      weather << self.scrape_tomorrow
    weather
  end

#https://www.accuweather.com/en/us/brooklyn-ny/11210/weather-forecast/334651
# http://brooklyn.news12.com/weather


  def self.scrape_today
    doc = Nokogiri::HTML(open("https://www.accuweather.com/en/us/brooklyn-ny/11210/weather-forecast/334651"
      ))
      today_temp = self.new
      @name = today_temp.name = doc.search(".bg.bg-su h4").text.strip
      @high = today_temp.high = doc.search(".bg.bg-su span.large-temp").first.text.strip
      @low = today_temp.low = doc.search(".bg.bg-s span.large-temp").text.strip
      @feel = today_temp.feel = doc.search(".bg.bg-su span.realfeel").first.text.strip
      #bring this up in 1on1. How to strip second realfeel temp
      @description = today_temp.description = doc.search(".bg.bg-su .info span.cond").first.text.strip
      today_temp
    end


    def self.scrape_tomorrow
      doc = Nokogiri::HTML(open("https://www.accuweather.com/en/us/brooklyn-ny/11210/weather-forecast/334651"
        ))
      tomorrow_temp = self.new
      @name = tomorrow_temp.name = doc.search(".bg.bg-r h4").text.strip
      @high = tomorrow_temp.high = doc.search(".bg.bg-r span.large-temp").text.strip
      @feel = tomorrow_temp.feel = doc.search(".bg.bg-r span.realfeel").text.strip
      @description = tomorrow_temp.description = doc.search(".bg.bg-r span.cond").text.strip
      tomorrow_temp
    end


    def self.current_scraper
      doc = Nokogiri::HTML(open("https://www.accuweather.com/en/us/brooklyn-ny/11210/weather-forecast/334651"
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
