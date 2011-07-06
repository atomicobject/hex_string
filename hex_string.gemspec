# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "hex_string"
  s.version     = "1.0.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Crosby", "Micah Alles"]
  s.email       = ["crosby@atomicobject.com", "alles@atomicobject.com"]
  s.homepage    = ""
  s.summary     = %q{String extensions to convert binary data to / from human readable hex tuples.}
  s.description = %q{String extensions to convert binary data to / from human readable hex tuples.}

  s.rubyforge_project = "hex_string"

  s.add_development_dependency("bundler", ">= 1.0.0")
  s.add_development_dependency("rake", ">= 0.8.0")
  s.add_development_dependency("yard", "~> 0.6.4")
  s.add_development_dependency("bluecloth", "~> 2.0.11")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
