class BeerPresenter::Style

  attr_accessor :beers, :breweries, :name
  @@all = []

  def initialize(name)
    @name = name
    @breweries = []
    @beers = []
    @@all << self
  end

  def self.all
    @@all
  end

  #put in module
  def add_beer(beer)
    self.beers << beer
  end

  #put in module
  def self.exist?(name)
    self.all.any?{|style| style.name == name}
  end

  #put in module
  def self.retrieve(name)
    self.all.detect{|style| style.name == name}
  end

end