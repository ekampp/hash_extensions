require 'date'

Gem::Specification.new do |s|
  s.name        = 'hash_extensions'
  s.version     = File.read('./lib/VERSION').chomp
  s.date        = Date.today.to_s
  s.summary     = "Some common, practical hash hash_extensions"
  s.description = "Some common, practical hash hash_extensions"
  s.authors     = ["Emil Kampp"]
  s.email       = 'emil@kampp.me'
  s.files       = ["lib/hash_extensions.rb"]
  s.homepage    = 'https://github.com/ekampp/hash_extensions'
  s.license     = 'MIT'

  s.add_runtime_dependency 'activesupport', '>= 4.2'
  s.add_development_dependency 'rspec', '~> 3.3'
  s.add_development_dependency 'rake', '~> 10.4'
end
