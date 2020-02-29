lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "config/version"

Gem::Specification.new do |spec|
  spec.name          = "comiclist"
  spec.version       = Comiclist::VERSION
  spec.authors       = ["Ryan Workman"]
  spec.email         = ["rdavid1099@users.noreply.github.com"]

  spec.summary       = %q{A simple Ruby gem that scrapes and parses comic release lists from http://www.comiclist.com/}
  spec.description   = %q{A simple Ruby gem that scrapes and parses comic release lists from http://www.comiclist.com/}
  spec.homepage      = "https://github.com/rdavid1099/comiclist"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rdavid1099/comiclist"
  # spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "nokogiri", "~> 1.10"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.7"
  spec.add_development_dependency "timecop", "~> 0.9"
  spec.add_development_dependency "pry"
end
