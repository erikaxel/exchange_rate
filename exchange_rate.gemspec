$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "exchange_rate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "exchange_rate"
  s.version     = ExchangeRate::VERSION
  s.authors     = ["Erik Nielsen"]
  s.email       = ["erikaxel@woodhouse.no"]
  s.homepage    = ""
  s.summary     = "Summary of ExchangeRate."
  s.description = "Description of ExchangeRate."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "money"
  s.add_dependency "eu_central_bank"

end
