class BeerPresenter::Brewery

  extend BeerPresenter::Common::ClassMethods
  include BeerPresenter::Common::InstanceMethods

  attr_accessor :beers, :name
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
      puts "#{index})\t" + "#{self.all[index - 1].name}".colorize(:light_blue)
      puts "\tBeers:"
      self.all[index - 1].beers.each do |beer|
        puts "\t\t#{beer.name}".colorize(:light_blue) + " - #{beer.style.name}"
      end
    else
      puts "\n\nThe number you entered is invalid. Please try again."
    end
  end

end 