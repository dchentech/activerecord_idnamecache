Gem::Specification.new do |s|
  s.name        = 'activerecord_idnamecache'
  s.version     = File.read("VERSION").strip
  s.date        = '2013-06-22'
  s.summary     = File.read("README.markdown").split(/===+/)[0].strip
  s.description = s.summary
  s.authors     = ["David Chen"]
  s.email       = 'mvjome@gmail.com'
  s.homepage    = 'http://github.com/mvj3/activerecord_idnamecache'

  s.files       = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
end
