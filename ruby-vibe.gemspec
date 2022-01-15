require_relative 'lib/ruby-vibe/version'

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
    lib/ruby-vibe.rb
    lib/ruby-vibe/bot.rb
    lib/ruby-vibe/client.rb
    lib/ruby-vibe/url.rb
    lib/ruby-vibe/version.rb
  ]

  spec.bindir = ['bin']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.6'

  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'rest-client', '~> 2.0'
end
