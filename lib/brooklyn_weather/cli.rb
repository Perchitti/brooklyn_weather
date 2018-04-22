  class BrooklynWeather::CLI

def call
  puts "Welcome to Brooklyn Weather"
  current
  day
end

def current
  puts "The current temperature is:"

  #insert scraping here
end
def day
  puts "Would you like to see the forecast for today or tomorrow?
  If you would like the weather for another borough type 'exit'."
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
    puts "Today or Tomorrow?"
  end
end


  def exit
    puts "It's called Brooklyn Weather for a reason. BYE!"
  end


end
