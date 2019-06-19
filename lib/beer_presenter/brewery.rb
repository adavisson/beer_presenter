class BeerPresenter::Brewery

  attr_accessor :beers, :name, :styles
  @@all = []

  def initialize(name)
    @name = name
    @beers = []

    #add to all
    @@all << self
  end

  def self.all
    @@all
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

  #put in module#############################################

  #Check input from user is valid
  def self.bounds_check(index)
    index.between?(1,self.all.length)
  end

  #add beer to instance beers array
  def add_beer(beer)
    self.beers << beer
  end

  #check if a brewery exists yet
  def self.exist?(name)
    self.all.any?{|style| style.name == name}
  end

  #return brewery instance of matching name
  def self.retrieve(name)
    self.all.detect{|style| style.name == name}
  end

  ###########################################################

end 