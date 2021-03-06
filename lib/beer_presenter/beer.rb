#require 'colorize'

class BeerPresenter::Beer

  extend BeerPresenter::Common::ClassMethods
  include BeerPresenter::Common::InstanceMethods

  attr_accessor :brewery, :description, :name, :rating, :style
  @@all = []

  def initialize(name, style, brewery, description, rating)
    @name = name
    @style = style
    @brewery = brewery
    @description = description
    @rating = rating

    #add to all
    @@all << self

    #add to brewery list
    self.brewery.add_beer(self)

    #add to style list
    self.style.add_beer(self)
  end

  def self.all
    @@all
  end

  #method for returning all details about a specific beer
  def self.beer_detail(index)
    if self.bounds_check(index)
      puts "\n\n"
      puts "#{index})\tName: " + "#{self.all[index - 1].name}".colorize(:light_blue)
      puts "\tStyle: #{self.all[index - 1].style.name}"
      puts "\tBrewery: #{self.all[index - 1].brewery.name}"
      puts "\tDescription: #{self.all[index - 1].description}"
      puts "\tRating: " + "#{self.all[index - 1].rating}\n\n".colorize(:red)
    else
      puts "\n\nThe number you entered is invalid. Please try again"
    end
  end

end