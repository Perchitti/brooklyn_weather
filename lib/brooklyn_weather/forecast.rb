class BrooklynWeather::Forecast
  attr_accessor :high, :low, :description, :name, :tonight

  @@all = []

  def initialize(high, low, description, name, tonight)
    @high = high
    @low = low
    @description = description
    @name = name
    @tonight = tonight
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    all.detect{|f| f.name = name}
  end

end
