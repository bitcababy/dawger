$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dawger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dawger"
  s.version     = Dawger::VERSION
  s.authors     = ["Meredith"]
  s.email       = ["meredith@xoala.com"]
  s.homepage    = "http://www.xoala.com"
  s.summary     = "Creates a dawg from a list of words"
  s.description = "TODO: Description of Dawger."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  # s.add_dependency "rails", "~> 3.1.3"

  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"

  s.rubygems_version = ">= 1.6.1"
  s.files            = `git ls-files`.split("\n").reject {|path| path =~ /\.gitignore$/ }
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"

end
