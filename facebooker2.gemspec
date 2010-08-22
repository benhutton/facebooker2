spec = Gem::Specification.new do |s|
  s.name = 'ryw-facebooker2'
  s.version = '0.0.5.x2'
  s.summary = "Facebook Connect integration library for ruby and rails (for Rspec2 + Rails3)"
  s.description = "Facebook Connect integration library for ruby and rails (for Rspec2 + Rails3)"
  s.files = Dir['lib/**/*.rb']
  s.require_path = 'lib'
  s.has_rdoc = false
  s.author = "Ryan Walker"
  s.email = "ry@anotherventure.com.com"
  s.homepage = "http://github.com/ryw/facebooker2"
  s.add_dependency('mogli', ">=0.0.12")
  s.add_dependency('ruby-hmac')
end
