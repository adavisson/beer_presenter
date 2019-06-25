class BeerPresenter::CLI

  def call
    input = ""

    until input == 'exit'
      puts "\n\nWelcome to Top 50 Beers on Untappd"
      puts "To list all of the Top 50 rated beers, please type 'all':"
      puts "To list all of the beers with full detail, please type 'full detail':"
      puts "To list all of the styles that are included in the Top 50, please type 'styles':"
      puts "To list all of the breweries that have beers in the Top 50, please type 'breweries':"
      puts "To exit, please type 'exit':\n\n"
  
      input = gets.strip
  
      case input
      when 'all'
        list_beers
      when 'full detail'
        full_detail
      when 'styles'
        list_styles
      when 'breweries'
        list_breweries
      when 'exit'
        break
      else
        puts "Invalid input. Please try typing your selection again."
      end   
    end

  end

  def beer_menu
    input = ""

    until input == 'exit'
      puts "\n\n"
      puts "To get the full detail on a specific beer, please select the number of the beer:"
      puts "Otherwise, to exit to the main menu, please type 'exit':\n\n"
  
      input = gets.strip
  
      case input
      when 'exit'
        break
      else
        BeerPresenter::Beer.beer_detail(input.to_i)
      end
    end
  end

  def style_menu
    input = ""

    until input == 'exit'
      puts "\n\n"
      puts "To list all of the beers of a certain style, please select the number of the style:"
      puts "Otherwise, to exit to the main menu, please type 'exit':\n\n"

      input = gets.strip

      case input
      when 'exit'
        break
      else
        BeerPresenter::Style.style_detail(input.to_i)
      end
    end
  end

  def brewery_menu
    input = ""
    until input == 'exit'
      puts "\n\n"
      puts "To list all of the beers from a specific brewery, please select the number of the style:"
      puts "Otherwise, to exit to the main menu, please type 'exit':\n\n"

      input = gets.strip

      case input
      when 'exit'
        break
      else
        BeerPresenter::Brewery.brewery_detail(input.to_i)
      end
    end
  end

  def list_beers
    index = 1
    puts "\n\n"
    BeerPresenter::Beer.all.each{|beer| puts "#{index})\t#{beer.name} - #{beer.style.name} - #{beer.brewery.name}"
    index += 1
    }
    beer_menu
  end

  def full_detail
    index = 1
    BeerPresenter::Beer.all.each{|beer| puts "#{index})\tName: #{beer.name}"
                                            puts "\tStyle: #{beer.style.name}"
                                            puts "\tBrewery: #{beer.brewery.name}"
                                            puts "\tDescription: #{beer.description}"
                                            puts "\tRating: #{beer.rating}\n\n"
                                            index += 1
    }
  end

  def list_styles
    index = 1
    BeerPresenter::Style.all.each{|style| puts "#{index})\t#{style.name}"
    index += 1
    }
    style_menu
  end

  def list_breweries
    index = 1
    BeerPresenter::Brewery.all.each{|brewery| puts "#{index})\t#{brewery.name}"
    index += 1
    }
    brewery_menu
  end

end