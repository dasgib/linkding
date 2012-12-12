ENV['DEPLOYMENT_TIME'] = Time.now.rfc2822

revision_file = Rails.root.join("REVISION")
ENV["RAILS_APP_VERSION"] = File.read(revision_file) if File.exist?(revision_file)

