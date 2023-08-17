class UserMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
  
      # Create an instance of the AWS SES client ss
      ses_client = Aws::SES::Client.new
  
      # Prepare the email content
      email_subject = 'Welcome to Our App!'
      email_body = render_to_string(template: 'user_mailer/welcome_email', layout: nil, formats: [:text])
  
      # Send the email using the AWS SDK
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
            text: {
              data: email_body
            }
          }
        }
      })
    end
  end
  