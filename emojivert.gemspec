# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emojivert/version'

Gem::Specification.new do |spec|
  spec.name          = "emojivert"
  spec.version       = Emojivert::VERSION
  spec.authors       = ["Phil Oye"]
  spec.email         = ["philoye@philoye.com"]
  spec.description   = %q{Translate emoji from one encoding to another.}
  spec.summary       = %q{Translate emoji from one encoding to another.}
  spec.homepage      = "http://github.com/philoye/emojivert"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', ['>= 3.0.0']
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
