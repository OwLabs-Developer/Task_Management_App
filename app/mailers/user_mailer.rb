require 'mailjet'

class UserMailer < ApplicationMailer
  def send_verification_email(user, verification_token)
    Mailjet.configure do |config|
      config.api_key = ENV['MAILJET_API_KEY']
      config.secret_key = ENV['MAILJET_API_SECRET']
      config.default_from = 'syafiqafro@gmail.com'
      config.api_version = 'v3.1'
    end

    @user = user
    mailjet_message = Mailjet::Send.create(messages: [{
      'From' => {
        'Email' => 'syafiqafro@gmail.com',
        'Name' => 'OWL_SYAFIQ'
      },
      'To' => [
        {
          'Email' => @user.email,
          'Name' => @user.username
        }
      ],
      'Subject' => 'Email Verification',
      'TextPart' => 'Click the link to verify your email',
      'HTMLPart' => '<h3>Click the link to verify your email</h3>'
    }])
  end
end




