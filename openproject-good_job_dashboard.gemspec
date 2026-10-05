# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = "openproject-good_job_dashboard"
  s.version     = "1.0.0"
  s.authors     = "Greenatom"
  s.email       = "project@greenatom.ru"
  s.summary     = "Embeds GoodJob dashboard for OpenProject administrators."
  # s.description = ''
  s.license     = "GPLv3"

  s.files = Dir["{app,config,db,lib,spec}/**/*", "README.md"]
  s.metadata["rubygems_mfa_required"] = "true"
end
