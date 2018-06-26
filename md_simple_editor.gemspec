# coding: utf-8

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'md_simple_editor/version'

Gem::Specification.new do |spec|
  spec.name          = 'md_simple_editor'
  spec.version       = MdSimpleEditor::VERSION
  spec.authors       = ['Ruben Espinosa']
  spec.email         = ['rderoldan1@gmail.com']
  spec.description   = 'Simple editor for markdown and rails'
  spec.summary       = 'Simple editor for markdown and rails'
  spec.homepage      = 'http://rderoldan1.github.io/md_simple_editor/'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($RS)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.add_runtime_dependency 'bootstrap', '~> 4.1.1'
  spec.add_runtime_dependency 'font-awesome-rails'
  spec.add_runtime_dependency 'redcarpet', '~> 3.4'
end
