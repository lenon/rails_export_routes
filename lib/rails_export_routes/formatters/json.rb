# frozen_string_literal: true

require 'json'

module RailsExportRoutes
  module Formatters
    class JSON
      def initialize(routes)
        @routes = routes
      end

      def export_to_file(file) # rubocop:disable Metrics/MethodLength
        data = @routes.map do |route|
          {
            verb: route.verb,
            path: route.path_spec,
            controller: route.controller,
            action: route.action,
            name: route.name,
            constraints: route.constraints.to_h
          }
        end

        File.open(file, 'wb') do |f|
          f.write(::JSON.generate(data))
        end
      end
    end
  end
end
