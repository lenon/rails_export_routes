# frozen_string_literal: true

require 'csv'
require 'json'

module RailsExportRoutes
  module Formatters
    class CSV
      def initialize(routes)
        @routes = routes
      end

      def export_to_file(file) # rubocop:disable Metrics/MethodLength
        ::CSV.open(file, 'wb') do |csv|
          csv << %w[verb path controller action name constraints]

          @routes.each do |route|
            csv << [
              route.verb,
              route.path_spec,
              route.controller,
              route.action,
              route.name,
              route.constraints.to_json
            ]
          end
        end
      end
    end
  end
end
