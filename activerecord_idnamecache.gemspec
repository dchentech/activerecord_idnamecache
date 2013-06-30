Gem::Specification.new do |s|
  s.name        = 'activerecord_idnamecache'
  s.version     = File.read("VERSION").strip
  s.date        = '2013-06-30'
  s.summary     = File.read("README.markdown").split(/===+/)[1].strip.split("\n")[0]
  s.description = s.summary
  s.authors     = ["David Chen"]
  s.email       = 'mvjome@gmail.com'
  s.homepage    = 'http://github.com/mvj3/activerecord_idnamecache'

  s.files       = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
end
