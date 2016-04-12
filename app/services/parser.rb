# parser service
class Parser
  # lib for work with url
  require 'open-uri'
  # gem for parsing
  require 'nokogiri'

  # it return array of hashes
  def self.parse_vc
    # url for parsing
    source = 'https://vc.ru/startups'
    # create object with page content
    page = Nokogiri::HTML(open(source))

    articles = []
    #search data for our articles objects
    page.css('div.b-articles__b_t2').each do |article|
      data = {}
      # more children, honey!
      data[:image_url] = article.children[1].children[1].children[1].attributes['src'].value
      data[:url] = article.children[3].children[0].attributes['href'].value
      data[:title] = article.children[3].children[0].children[0].text
      
      articles << data
    end
    articles
  end

end
