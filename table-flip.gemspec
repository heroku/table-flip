# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'table_flip/version'

Gem::Specification.new do |spec|
  spec.name          = "table-flip"
  spec.version       = Table::Flip::VERSION
  spec.authors       = ["Andrew Appleton"]
  spec.email         = ["andrew@heroku.com"]

  spec.summary       = "Bail if the database contains any data. Handy to prevent stupid stuff like running tests against a database full of data. Which I have never done. Nope, not me."
  spec.homepage      = "https://github.com/heroku/table-flip"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sequel"
  spec.add_development_dependency "sqlite3"
end
