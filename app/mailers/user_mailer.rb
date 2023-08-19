class UserMailer < ApplicationMailer

  def verification_email(user)
    @user = user
    @verification_url = verify_email_session_custom_url(token: @user.verification_token, username: @user.username)

    # Prepare the email content
    email_subject = 'Verify Your Email'
    email_body = render_to_string(template: 'user_mailer/verification_email', layout: nil)

    # Send the email using the AWS SDK or other email sending mechanism
    ses_client = Aws::SES::Client.new

    ses_client.send_email({
      source: 'noreply@owlabs.online', # Replace with your sender email
      destination: {
        to_addresses: [@user.email]
      },
      message: {
        subject: {
          data: email_subject
        },
        body: {
          html: {
            data: email_body
          }
        }
      }
    })
  end
end

