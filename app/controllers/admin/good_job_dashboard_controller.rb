# frozen_string_literal: true

module Admin
  class GoodJobDashboardController < ::ApplicationController
    layout "admin"
    before_action :require_admin
    menu_item :good_job_dashboard_settings

    def show; end

    def legacy_settings
      redirect_to admin_good_job_dashboard_path
    end

    def removed_settings
      head :gone
    end
  end
end
