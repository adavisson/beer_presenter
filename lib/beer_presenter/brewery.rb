class BeerPresenter::Brewery

  attr_accessor :beers, :name, :styles
  @@all = []

  def initialize(name)
    @name = name
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

  def self.brewery_detail(index)
    if self.bounds_check(index)
      puts "\n\n"
      puts "#{index})\t #{self.all[index - 1].name}"
      puts "\tBeers:"
      self.all[index - 1].beers.each do |beer|
        puts "\t\t#{beer.name} - #{beer.style.name}"
      end
    else
      puts "\n\nThe number you entered is invalid. Please try again."
    end
  end

  #put in module
  def self.bounds_check(index)
    index.between?(1,self.all.length)
  end

end 