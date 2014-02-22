# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails/sse/version'

Gem::Specification.new do |spec|
  spec.name          = "sse-rails"
  spec.version       = Rails::SSE::VERSION
  spec.authors       = ["Antonio Scandurra"]
  spec.email         = ["as-cii@outlook.com"]
  spec.description   = %q{SSE for rails, made easy.}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/as-cii/sse-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
