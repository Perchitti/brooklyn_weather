#this code acts as the enviornment
require 'open-uri'
#require 'pry'
#require 'nokogiri'

#WHY DOESNT It ALLOW NOKOGIRI FROM HERE?


#requiring version
require_relative './brooklyn_weather/version'

#requiring cli
require_relative './brooklyn_weather/cli'


#requiring scraper
require_relative './brooklyn_weather/scraper'
