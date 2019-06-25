module BeerPresenter::Common
  module ClassMethods
    #Check if input from user is valid
    def bounds_check(index)
      index.between?(1,self.all.length)
    end
  
    #Return style instance based on name
    def retrieve(name)
      self.all.detect{|style| style.name == name}
    end
  
    #Check if style/brewery exists yet
    def exist?(name)
      self.all.any?{|style| style.name == name}
    end
  end

  module InstanceMethods
    #Add beer to beers array
    def add_beer(beer)
      self.beers << beer
    end
  end

end