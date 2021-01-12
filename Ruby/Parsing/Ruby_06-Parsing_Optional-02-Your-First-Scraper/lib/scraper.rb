require "open-uri"
require "nokogiri"

def scrape_craiglist_antiques(city)
  # TODO: return an array of Antiques found of Craigslist for this `city`.
  doc = Nokogiri::HTML(open("http://#{city}.craigslist.org/search/ata"))
  list = doc.search('.hdrlnk')
  arr = []
  list.each do |element|
    arr << element.text
  end
  arr
end
