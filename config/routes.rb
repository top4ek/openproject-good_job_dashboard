# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resource :good_job_dashboard, only: :show, controller: :good_job_dashboard

    get "settings/plugin/openproject_good_job_dashboard", to: "good_job_dashboard#legacy_settings"
    post "settings/plugin/openproject_good_job_dashboard", to: "good_job_dashboard#removed_settings"

    mount GoodJob::Engine => "good_job", as: :good_job_admin
  end
end
