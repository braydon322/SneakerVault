require 'open-uri'
require 'nokogiri'

class ReleaseScraper

  attr_accessor :image_url
  #attr_accessor :name, :price, :availability, :url
  @new_releases = []
  @image_url =''

  def self.all
    @new_releases
  end

  def self.url
    @image_url
  end

  def self.scrape_shoe(url)
    doc = Nokogiri::HTML(open(url))
    @image_url = doc.search('#res').search('img').attr('src').text
  end

  def self.scrape_release

    doc = Nokogiri::HTML(open("https://sneakernews.com/release-dates/"))
    shoes_list = doc.search('div.popular-releases-block li')
    shoes_list.each do |individual_shoe|
      @new_releases << {:shoe_name => individual_shoe.search('strong').text, :release_date => individual_shoe.search('em').text, :url => individual_shoe.search('img').attr('src').text}
    end
  end

end
