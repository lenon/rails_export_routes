# frozen_string_literal: true

require 'delegate'

module RailsExportRoutes
  class RouteWrapper < SimpleDelegator
    def path_spec
      path.spec.to_s
    end

    def controller
      requirements[:controller]
    end

    def action
      requirements[:action]
    end

    def constraints
      requirements.except(:controller, :action)
    end
  end
end
