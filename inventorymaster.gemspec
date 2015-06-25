# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "inventorymaster/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "inventorymaster"
  s.version     = "0.1.1"
  s.authors     = ["jcottobboni"]
  s.email       = ["jcottobboni@gmail.com"]
  s.homepage   = "https://github.com/jcottobboni/inventorymaster"
  s.summary     = "Inventory system engine"
  s.description = "This gem provides a basic inventory system engine"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.1.0"
  s.add_dependency "nested_form", ">=0"
  s.add_dependency "kaminari",">=0"
  s.add_dependency "searchkick",">=0"
  s.add_dependency "activejob_backport",">=0"
  s.add_dependency "wicked_pdf",">=0"
  s.add_dependency "wkhtmltopdf-binary",">=0"


end
