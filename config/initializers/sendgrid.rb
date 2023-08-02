ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  domain: 'yourdomain.com', # Replace with your actual domain
  user_name: 'Email Direct Message',      # This is the SendGrid API username
  password: "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",
  authentication: :plain,
  enable_starttls_auto: true
}