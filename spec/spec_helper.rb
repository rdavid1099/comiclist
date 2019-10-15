require "bundler/setup"
require "webmock/rspec"
require "pry"
require "timecop"
require "comiclist"

CURRENT_DAY = Time.local(2019, 10, 13)
PAST_DAY = Time.local(2019, 5, 7)
FUTURE_DAY = Time.local(2019, 12, 4)

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    stub_request(:get, %r{comiclist.com})
      .to_return(
        lambda { |req| File.new("./spec/fixtures/list_for_#{req.uri.to_s.split("-")[-3..-1].join("-")}.txt") }
      )
    Timecop.freeze(CURRENT_DAY)
  end
end
