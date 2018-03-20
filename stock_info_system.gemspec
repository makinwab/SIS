
# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stock_info_system/version'

Gem::Specification.new do |spec|
  spec.name          = 'stock_info_system'
  spec.version       = StockInfoSystem::VERSION
  spec.authors       = ['Makinwa Bukola']
  spec.email         = ['bukola.makinwa@andela.com']

  spec.summary       = 'Get Stock info on Return and Drawdown'
  spec.description   = 'Get Stock info on Return and Drawdown'
  spec.homepage      = 'http://github.com/andela-bmakinwa/sis'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'mail'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'dotenv'
end
