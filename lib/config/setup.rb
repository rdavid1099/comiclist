require 'nokogiri'
require 'open-uri'

path = __dir__

require "#{path}/../config/version"

require "#{path}/../comiclist/scraper"
require "#{path}/../comiclist"
