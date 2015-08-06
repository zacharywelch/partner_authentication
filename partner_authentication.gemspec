$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "partner_authentication/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "partner_authentication"
  s.version     = PartnerAuthentication::VERSION
  s.authors     = ["zwelchcb"]
  s.email       = ["Zachary.Welch@careerbuilder.com"]
  s.homepage    = "https://cagit.careerbuilder.com/zwelch/partner_authentication"
  s.summary     = "Partner authentication for rails api."
  s.description = "Partner authentication for rails api."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "responders"
  s.add_development_dependency "mocha"
end
