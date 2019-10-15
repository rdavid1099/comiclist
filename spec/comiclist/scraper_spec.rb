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
end
