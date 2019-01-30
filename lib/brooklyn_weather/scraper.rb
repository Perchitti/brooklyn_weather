

class BrooklynWeather::Scraper

  # we're moving these to the Forecast class
  # attr_accessor :high, :low, :description, :name, :tonight

#https://www.accuweather.com/en/us/brooklyn-ny/11210/weather-forecast/334651
  BASE_URL = "https://www.accuweather.com/en/us/brooklyn-ny/11210/daily-weather-forecast/334651?day="

  def self.scrape_today
    doc = Nokogiri::HTML(open("https://www.accuweather.com/en/us/brooklyn-ny/11210/daily-weather-forecast/334651?day=1"
      ))
      name = doc.search(".clearfix h3.lt time").text.strip
      high = doc.search("#detail-day-night .day span.large-temp").text.strip
      /high = doc.search("#content .column-1.clearfix .block.day .column.temps .main span.temp").text.strip/
      low = doc.search("#detail-day-night .night span.large-temp").text.strip
      description = doc.search("#detail-day-night .day .cond").text.strip
      tonight =  doc.search("#detail-day-night .night .cond").text.strip
      BrooklynWeather::Forecast.new(high, low, description, name, tonight)
    end


    def self.scrape_tomorrow
      doc = Nokogiri::HTML(open("https://www.accuweather.com/en/us/brooklyn-ny/11210/daily-weather-forecast/334651?day=2"
        ))
      name = doc.search("li.day.fday2.current.cl h4").text.strip
      high = doc.search("li.day.fday2.current.cl span.large-temp").text.strip
      low = doc.search("li.day.fday2.current.cl span.small-temp").text.strip
      description = doc.search("li.day.fday2.current.cl span.cond").text.strip
      tonight = doc.search("#detail-day-night .night .cond").text.strip
      BrooklynWeather::Forecast.new(high, low, description, name, tonight)
    end

    def self.scrape_future(num)
      doc = Nokogiri::HTML(open("#{BASE_URL}#{num}"))
      name = doc.search("li.day.fday#{num}.current.cl h4").text.strip
      high = doc.search("li.day.fday2.current.cl span.large-temp").text.strip
      low = doc.search("li.day.fday2.current.cl span.small-temp").text.strip
      description = doc.search("li.day.fday2.current.cl span.cond").text.strip
      tonight = doc.search("#detail-day-night .night .cond").text.strip
      BrooklynWeather::Forecast.new(high, low, description, name, tonight)
    end


    def self.current_scraper
      doc = Nokogiri::HTML(open("https://www.accuweather.com/en/us/brooklyn-ny/11210/daily-weather-forecast/334651?day=1"
        ))
        /current_temp = doc.search("#current-city-tab span.local-temp").text.strip/
        current_temp = doc.search("#forecast-extended .subnav .subnav-dropdown-container span").text.strip
      end


end
