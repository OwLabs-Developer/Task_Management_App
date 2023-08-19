class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@owlabs.online'
  layout 'mailer'
  default_url_options[:host] = 'owlabs.online' # Adjust this to your actual host
end
