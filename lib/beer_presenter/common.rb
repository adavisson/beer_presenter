class BeerPresenter::Common

  def initialize

  end
  
  #Check if input from user is valid
  def self.bounds_check(index)
    index.between?(1,self.all.length)
  end

  #Add beer to beers array
  def add_beer(beer)
    self.beers << beer
  end

  #Check if style/brewery exists yet
  def self.exist?(name)
    self.all.any?{|style| style.name == name}
  end

  #Return style instance based on name
  def self.retrieve(name)
    self.all.detect{|style| style.name == name}
  end


end