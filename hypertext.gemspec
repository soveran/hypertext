Gem::Specification.new do |s|
  s.name              = "hypertext"
  s.version           = "0.0.1"
  s.summary           = "Hypertext authoring"
  s.description       = "Hypertext authoring with Ruby"
  s.authors           = ["Michel Martens"]
  s.email             = ["michel@soveran.com"]
  s.homepage          = "https://github.com/soveran/hypertext"
  s.license           = "MIT"

  s.files = `git ls-files`.split("\n")

  s.add_development_dependency "cutest"
end
