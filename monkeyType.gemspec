Gem::Specification.new do |s|
  s.name        = 'monkey_type'
  s.version     = '0.0.4'
  s.required_ruby_version = '>= 2.0'
  s.date        = '2016-07-24'
  s.summary     = "A microgem thats adds a micro type system to ruby"
  s.description = "Only 70 lines. Add a optional type system to ruby using runtime checks and contracts . make it crash early, know exactly what a function (or method)
                  returns and specify the 'type' of the parameters using good old ducktyping"
  s.authors     = ["Felipe Vieira"]
  s.email       = 'felipetavres@gmail.com'
  s.files       = ["lib/monkey_type.rb"]
  s.homepage    =
    'https://github.com/nemoNoboru/monkey_type'
  s.license       = 'MIT'
end
