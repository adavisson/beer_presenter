class BeerPresenter::Brewery < BeerPresenter::Common

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

end 