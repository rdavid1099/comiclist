RSpec.describe Comiclist::Scraper do
  context "#initialize" do
    it "saves the next wednesday if no date given" do
      scraper = Comiclist::Scraper.new

      expect(scraper.sanitized_date).to eq("10-16-2019")
    end

    it "converts a past date to the next wednesday" do
      scraper = Comiclist::Scraper.new(PAST_DAY)

      expect(scraper.sanitized_date).to eq("05-08-2019")
    end

    it "converts a future date to the next wednesday" do
      scraper = Comiclist::Scraper.new(FUTURE_DAY)

      expect(scraper.sanitized_date).to eq("12-04-2019")
    end
  end

  context "#list_of_publishers" do
    it "returns an array of all publishers" do
      scraper = Comiclist::Scraper.new

      expect(scraper.list_of_publishers.length).to eq(66)
      expect(scraper.list_of_publishers.include?("MARVEL COMICS")).to eq(true)
      expect(scraper.list_of_publishers.include?("DC COMICS")).to eq(true)
    end

    it "returns an empty array if bad request" do
      scraper = Comiclist::Scraper.new(FUTURE_DAY)

      expect(scraper.list_of_publishers.count).to eq(0)
      expect(scraper.list_of_publishers).to eq([])
    end
  end
end
