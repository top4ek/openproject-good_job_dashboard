# frozen_string_literal: true

module OpenProject
  module GoodJobDashboard
    module Authentication
      extend ActiveSupport::Concern
      include OpenProject::Authentication::SessionExpiration

      included do
        prepend_before_action :require_openproject_admin
        after_action :prevent_dashboard_caching
      end

      private

      def require_openproject_admin
        reset_session if session_ttl_expired?

        user = User.active.find_by(id: session[:user_id]) if session[:user_id]
        return require_openproject_login unless user
        return head :forbidden unless user.admin?

        session[:updated_at] = Time.current
      end

      def require_openproject_login
        if request.format.html?
          redirect_to main_app.signin_path(back_url: main_app.admin_good_job_dashboard_path)
        else
          head :unauthorized
        end
      end

      def prevent_dashboard_caching
        no_store
      end
    end
  end
end
