class BeerPresenter::Style

  attr_accessor :beers, :breweries, :name
  @@all = []

  def initialize(name)
    @name = name
    @beers = []
    @@all << self
  end

  def self.all
    @@all
  end

  
  def self.style_detail(index)
    if self.bounds_check(index)
      puts "\n\n"
      puts "#{index})\t #{self.all[index - 1].name}"
      puts "\tBeers:"
      self.all[index - 1].beers.each do |beer|
        puts "\t\t#{beer.name} - #{beer.brewery.name}"
      end
    else
      puts "\n\nThe number you entered is invalid. Please try again."
    end
  end

  #put in module####################################################

  #Check if input from user is valid
  def self.bounds_check(index)
    index.between?(1,self.all.length)
  end

  #Add beer to beers array
  def add_beer(beer)
    self.beers << beer
  end

  #Check if style exists yet
  def self.exist?(name)
    self.all.any?{|style| style.name == name}
  end

  #Return style instance based on name
  def self.retrieve(name)
    self.all.detect{|style| style.name == name}
  end


end