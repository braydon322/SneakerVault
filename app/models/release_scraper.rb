require 'open-uri'
require 'nokogiri'

class ReleaseScraper

  attr_accessor :image_urls, :new_releases, :listings
  #attr_accessor :name, :price, :availability, :url
  @new_releases = []
  @image_urls =''

  def self.new_releases
    @new_releases
  end

  def self.image_urls
    @image_url
  end

  def self.scrape_shoe(url)
    doc = Nokogiri::HTML(open(url))
    @image_urls = doc.search('#res').search('img').attr('src').text
  end

  def self.scrape_release

    doc = Nokogiri::HTML(open("https://sneakernews.com/release-dates/"))
    shoes_list = doc.search('div.popular-releases-block li')
    shoes_list.each do |individual_shoe|
      @new_releases << {:shoe_name => individual_shoe.search('strong').text, :release_date => individual_shoe.search('em').text, :url => individual_shoe.search('img').attr('src').text, :page_link => individual_shoe.search('a').attr('href').text}
    end
  end

end
