Gem::Specification.new do |s|
  s.name        = 'activerecord_idnamecache'
  s.version     = File.read("VERSION").strip
  s.date        = '2013-05-31'
  s.summary     = "Use Mysql AUTO_INCREMENT to support key value cache, which should be combined by an integer and string."
  s.description = s.summary + " If cache hit ratio is high, performance will be better, and so does the memory usage rate"
  s.authors     = ["David Chen"]
  s.email       = 'mvjome@gmail.com'
  s.homepage    = 'http://github.com/mvj3/activerecord_idnamecache'

  s.files       = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
end
