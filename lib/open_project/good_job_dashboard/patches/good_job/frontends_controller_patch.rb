# frozen_string_literal: true

module OpenProject
  module GoodJobDashboard
    module Patches
      module GoodJob
        module FrontendsControllerPatch
          extend ActiveSupport::Concern

          include OpenProject::GoodJobDashboard::Authentication
        end
      end
    end
  end
end
