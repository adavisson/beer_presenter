class BeerPresenter::Scraper
  
  attr_reader :list, :page

  def initialize
    @page = Nokogiri::HTML(open("https://untappd.com/beer/top_rated"))
    @list = page.css(".beer-item")
  end

  #Notes on how to grab each element needed
  #beer_name: list.css(".name").text.strip
  #style_name: list.css(".style")[1].text.strip
  #brewery_name: list.css(".style a").text.strip
  #abv: list.css(".abv").text.strip
  #description: list.css(".desc")[1].text.strip   SANITIZE TO REMOVE "READ LESS"
  #rating: list.css(".num").text.strip

  #This method scrapes the page and creates new Beer objects
  #It also determines if new Brewery or Style objects need to be created
  def scrape
    
    i = 0
    
    while i < self.list.length

      if !(BeerPresenter::Style.exist?(self.list[i].css(".style")[1].text.strip))
        style = self.create_style(self.list[i].css(".style")[1].text.strip)
      else
        style = BeerPresenter::Style.retrieve (self.list[i].css(".style")[1].text.strip)
      end

      if !(BeerPresenter::Brewery.exist?(self.list[i].css(".style a").text.strip))
        brewery = self.create_brewery(self.list[i].css(".style a").text.strip)
      else
        brewery = BeerPresenter::Brewery.retrieve(self.list[i].css(".style a").text.strip)
      end

      self.create_beer(self.list[i].css(".name").text.strip, #beer-name
                              style, #style
                              brewery, #brewery
                              self.list[i].css(".desc")[1].text.strip, #description
                              self.list[i].css(".num").text.strip #rating
      )

      i += 1
    end

  end

  #Cleaner methods for creating objects
  def create_beer(name, style, brewery, description, rating)
    BeerPresenter::Beer.new(name, style, brewery, description, rating)
  end

  def create_brewery(name)
    BeerPresenter::Brewery.new(name)
  end

  def create_style(name)
    BeerPresenter::Style.new(name)
  end

end