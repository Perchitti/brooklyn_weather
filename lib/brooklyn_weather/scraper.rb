

class BrooklynWeather::Scraper

attr_accessor :high, :low, :description, :name

  def self.forecast
    self.scrape
  end


  def self.scrape
    weather = []
      weather << self.scrape_today
      weather << self.scrape_tomorrow
    weather
  end

#https://www.accuweather.com/en/us/brooklyn-ny/11210/weather-forecast/334651
# http://brooklyn.news12.com/weather

  def self.current_scraper
    doc = Nokogiri::HTML(open("https://www.accuweather.com/en/us/brooklyn-ny/11210/weather-forecast/334651"
      ))
      current_temp = doc.search("#current-city-tab span.local-temp").text.strip
    end


  def self.scrape_today
    doc = Nokogiri::HTML(open("https://www.accuweather.com/en/us/brooklyn-ny/11210/weather-forecast/334651"
      ))
      today_temp = self.new
      today_temp.name = doc.search(".bg.bg-r h4").text.strip
      today_temp.high = doc.search(".bg.bg-r span.large-temp").text.strip
      #today_temp.low = "60"
      today_temp.description = doc.search(".bg.bg-r span.cond").text.strip
      today_temp
    end


    def self.scrape_tomorrow
      doc = Nokogiri::HTML(open("https://www.accuweather.com/en/us/brooklyn-ny/11210/weather-forecast/334651"
        ))
      tomorrow_temp = self.new
      tomorrow_temp.name = doc.search(".bg.bg-su h4").text.strip
      tomorrow_temp.high = doc.search(".bg.bg-su span.large-temp").text.strip
      #tomorrow_temp.low = " 80"
      tomorrow_temp.description = doc.search(".bg.bg-su span.cond").text.strip
      tomorrow_temp
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
