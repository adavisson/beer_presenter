class BeerPresenter::Beer

  attr_accessor :brewery, :description, :name, :rating, :style
  @@all = []

  def initialize(name = nil, style = nil, brewery = nil, description = nil, rating = nil)
    @name = name
    @style = style
    @brewery = brewery
    @description = description
    @rating = rating

    @@all << self

    #add to brewery list
    self.brewery.add_beer(self)

    #add to style list
    self.style.add_beer(self)
  end

  def self.all
    @@all
  end

  def self.beer_detail(index)
    if self.bounds_check(index)
      puts "\n\n"
      puts "#{index})\tName: #{self.all[index - 1].name}"
      puts "\tStyle: #{self.all[index - 1].style.name}"
      puts "\tBrewery: #{self.all[index - 1].name}"
      puts "\tDescription: #{self.all[index - 1].description}"
      puts "\tRating: #{self.all[index - 1].rating}\n\n"
    else
      puts "\n\nThe number you entered is invalid. Please try again"
    end
  end

  #put in module
  def self.bounds_check(index)
    index.between?(1,self.all.length)
  end

end