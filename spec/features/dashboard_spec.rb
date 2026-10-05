# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Embedded GoodJob dashboard", :js, :selenium do
  let(:admin) { create(:admin) }

  it "loads GoodJob scripts, charts and navigation inside the administration page" do
    login_as admin
    visit admin_good_job_dashboard_path

    expect(page).to have_current_path(admin_good_job_dashboard_path)
    within_frame(find("iframe[title='GoodJob dashboard']")) do
      expect(page).to have_css("canvas", wait: 20)
      expect(page).to have_no_css("html[data-turbo-unloaded]", visible: :all)
      expect(page.evaluate_script("Object.keys(Chart.instances).length")).to be_positive

      find("a[href*='/processes']").click
      expect(page).to have_css("a[href*='/processes'].active", wait: 20)
    end

    expect(page).to have_current_path(admin_good_job_dashboard_path)
    expect(page).to have_css("iframe[title='GoodJob dashboard']")
  end
end
