require 'nokogiri'
require 'open-uri'

module Comiclist
  class Scraper
    BASE_URI = "http://www.comiclist.com/index.php/lists/comiclist-new-comic-book-releases-list-for-".freeze
    attr_reader :doc

    def initialize(date)
      @doc = Nokogiri::HTML(open("#{BASE_URI}#{date}"))
    end

    def list_of_publishers
      publisher_positions.keys
    end

    def fetch_publisher_comics(publisher)
      return unless raw_publisher_content = publisher_content(publisher)

      raw_publisher_content.children.css('a').reduce({}) do |result, elem|
        result[elem.children.first.text] = elem.attribute('href').value if elem.children.first && elem.children.first.text
        result
      end
    end

    private
    def content
      doc.css("div.post-content").first
    end

    def publisher_content(publisher_name)
      return unless content_index = publisher_positions[publisher_name.upcase]

      content.children[content_index]
    end

    def publisher_positions
      @publisher_positions ||= content.children.map.with_index do |elem, i|
        [elem.css('b').first.text, i] if elem.css('b').first && elem.css('b').first.text != "PUBLISHER"
      end.compact.to_h
    end
  end
end
