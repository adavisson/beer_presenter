class BeerPresenter::Beer

  attr_accessor :brewery, :description, :name, :rating, :style
  @@all = []

  def initialize(name = "Miller Lite", style = "Pilsner", brewery = "Miller Coors", description = "A beer", rating = "(4.2)")
    @name = name
    @style = style
    @brewery = brewery
    @description = description
    @rating = rating

    @@all << self
    #add to brewery list
    #add to style list
  end

  def self.all
    @@all
  end

end