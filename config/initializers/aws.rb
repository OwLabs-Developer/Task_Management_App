require 'aws-sdk-ses'
require 'dotenv/load'

# config/initializers/aws.rb
Aws.config.update({
  region: 'ap-southeast-2', # Replace with your preferred region code
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
})
