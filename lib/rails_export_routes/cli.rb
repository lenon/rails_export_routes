# frozen_string_literal: true

require 'thor'

module RailsExportRoutes
  class CLI < Thor
    def self.exit_on_failure?
      true # Thor must exit with status 1 on errors
    end

    desc('export FILE', 'export Rails routes to FILE')
    method_option(:format, type: :string,
                           default: 'csv',
                           enum: %w[csv json json-pretty])
    def export(file)
      load_rails_app(Dir.pwd)

      formatter = case options.fetch(:format)
                  when 'csv' then Formatters::CSV
                  when 'json' then Formatters::JSON
                  when 'json-pretty' then Formatters::JSONPretty
                  end

      formatter.new(wrapped_rails_routes).export_to_file(file)
    end

    no_commands do
      def load_rails_app(app_path)
        require "#{app_path}/config/environment.rb"
      rescue ::LoadError
        raise Error, "Rails app not found in #{app_path}"
      end

      def wrapped_rails_routes
        Rails.application.routes.routes.reject(&:internal).map do |route|
          RouteWrapper.new(route)
        end
      end
    end
  end
end
