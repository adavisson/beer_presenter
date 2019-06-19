class BeerPresenter::CLI

  def call

    input = ""
#############################################################################
#    miller = BeerPresenter::Beer.new()
#    budweiser = BeerPresenter::Beer.new(name = "Budweiser", style = "Lager", brewery = "Busch", description = "A less good beer", rating = 3.5)
#
#    pilsner = BeerPresenter::Style.new("Pilsner")
#    lager = BeerPresenter::Style.new("Lager")
#    
#    miller_coors = BeerPresenter::Brewery.new("Miller Coors")
#    busch = BeerPresenter::Brewery.new("Busch")
#############################################################################    

    until input == 'exit'
      puts "Welcome to Top 50 Beers on Untappd"
      puts "To list all of the Top 50 rated beers, please type 'all':"
      puts "To list all of the styles that are included in the Top 50, please type 'styles':"
      puts "To list all of the breweries that have beers in the Top 50, please type 'breweries':"
      puts "To exit, please type 'exit'"
  
      input = gets.strip
  
      case input
      when 'all'
        BeerPresenter::Beer.all.each{|beer| puts "Name: #{beer.name}"
                                            puts "Style: #{beer.style.name}"
                                            puts "Brewery: #{beer.brewery.name}"
                                            puts "Description: #{beer.description}"
                                            puts "Rating: #{beer.rating}\n\n"
        }
      when 'styles'
        BeerPresenter::Style.all.each{|style| puts "Name: #{style.name}"}
      when 'breweries'
        BeerPresenter::Brewery.all.each{|brewery| puts "Name: #{brewery.name}"}
      when 'exit'
        puts input
      end

      if input == 'exit'
        break
      end    
    end

  end

end