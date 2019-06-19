require 'nokogiri'
require 'open-uri'
require 'pry'

class BeerPresenter::Scraper
  
  attr_reader :list, :page

  def initialize
    @page = Nokogiri::HTML(open("https://untappd.com/beer/top_rated"))
    @list = page.css(".beer-item")
  end

  #beer_name: list.css(".name").text.strip
  #style_name: list.css(".style")[1].text.strip
  #brewery_name: list.css(".style a").text.strip
  #abv: list.css(".abv").text.strip
  #description: list.css(".desc")[1].text.strip
  #rating: list.css(".num").text.strip

  def scrape
    
    i = 0
    
    while i < self.list.length

      if !(BeerPresenter::Style.exist?(self.list[i].css(".style")[1].text.strip))
        style = BeerPresenter::Style.new(self.list[i].css(".style")[1].text.strip)
      else
        style = BeerPresenter::Style.retrieve (self.list[i].css(".style")[1].text.strip)
      end

      if !(BeerPresenter::Brewery.exist?(self.list[i].css(".style a").text.strip))
        brewery = BeerPresenter::Brewery.new(self.list[i].css(".style a").text.strip)
      else
        brewery = BeerPresenter::Brewery.retrieve(self.list[i].css(".style a").text.strip)
      end

      BeerPresenter::Beer.new(self.list[i].css(".name").text.strip, #beer-name
                              style, #style
                              brewery, #brewery
                              self.list[i].css(".desc")[1].text.strip, #description
                              self.list[i].css(".num").text.strip #rating
      )

      i += 1
    end

  end

  def create beer
    #initialize beer and check if brewery and style need to be created
  end

  def create_brewery
    #initialize brewery
  end

  def create_style
    #initialize style
  end

end