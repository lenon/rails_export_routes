# frozen_string_literal: true

require_relative 'lib/rails_export_routes/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_export_routes'
  spec.version       = RailsExportRoutes::VERSION
  spec.authors       = ['Lenon Marcel']
  spec.email         = ['lenon.marcel@gmail.com']

  spec.summary       = 'Tool to export Rails routes to CSV'
  spec.description   = 'Tool to export Rails routes to CSV'
  spec.homepage      = 'https://github.com/lenon/rails_export_routes'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  spec.metadata['homepage_uri'] = 'https://github.com/lenon/rails_export_routes'
  spec.metadata['source_code_uri'] = 'https://github.com/lenon/rails_export_routes'
  spec.metadata['changelog_uri'] = 'https://github.com/lenon/rails_export_routes/blob/main/CHANGELOG.md'

  spec.files = Dir['lib/**/*'] + Dir['exe/**/*'] + %w[LICENSE.txt README.md]
  spec.bindir = 'exe'
  spec.executables = ['rails_export_routes']
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 6.0.0'
  spec.add_dependency 'thor'
end
