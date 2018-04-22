class BrooklynWeather::Scraper

attr_accessor :name, :temp, :description

def self.forecast


today_temp = self.new
today_temp.name = "Today"
today_temp.temp = "60"
today_temp.description = "Sunny"


tomorrow_temp = self.new
tomorrow_temp.name = "Tomorrow"
tomorrow_temp.temp = " 80"
tomorrow_temp.description = "Sunny"


#want to return today_temp & tomorrow_temp

[today_temp, tomorrow_temp]
end


end
