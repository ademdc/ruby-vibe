require_relative 'lib/ruby_vibe/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby-vibe'
  spec.version       = RubyVibe::VERSION
  spec.authors       = ['Adem Dinarevic']
  spec.email         = ['ademdinarevic@gmail.com']
  spec.homepage      = 'https://github.com/ademdc/ruby-vibe'
  spec.license       = 'MIT'
  spec.summary       = "Ruby client for Viber API"
  spec.description   = "Ruby client for Viber API"
  spec.require_paths = ['lib']
  
  spec.files         =  %w[
    lib/ruby_vibe.rb
    lib/ruby_vibe/client.rb
    lib/ruby_vibe/calls.rb
    lib/ruby_vibe/version.rb
    lib/ruby_vibe/configuration.rb
    lib/ruby_vibe/urls.rb
    lib/ruby_vibe/calls/info.rb
    lib/ruby_vibe/calls/messaging.rb
  ]

  spec.add_development_dependency 'bundler', '2.1.4'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'rest-client', '~> 2.0'
end
