# frozen_string_literal: true

require "open_project/plugins"
module OpenProject
  module GoodJobDashboard
    class Engine < ::Rails::Engine
      include OpenProject::Plugins::ActsAsOpEngine

      engine_name :openproject_good_job_dashboard
      register "openproject-good_job_dashboard",
               author_url: "https://www.greenatom.ru",
               requires_openproject: ">= 14.1.0",
               bundled: true do
        menu :admin_menu,
             :good_job_dashboard_settings,
             { controller: "/admin/good_job_dashboard", action: :show },
             if: Proc.new { User.current.admin? },
             caption: :"plugin_openproject_good_job_dashboard.name",
             parent: :settings
      end

      patch_with_namespace :GoodJob, :FrontendsController

      initializer "openproject_good_job_dashboard.authentication" do
        ActiveSupport.on_load(:good_job_application_controller) do
          include OpenProject::GoodJobDashboard::Authentication
        end
      end
    end
  end
end
