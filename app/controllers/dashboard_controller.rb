class DashboardController < ApplicationController
  def index
    @webhook_events = WebhookEvent.all
  end

  def send_email
    if sendgrid_email_successful?
      redirect_to root_path, notice: 'Your email has been sent.'
    else
      redirect_to root_path, alert: 'Error in sending email.'
    end
  end


  private

  def sendgrid_email_successful?
    data = {
      personalizations: [
        {
          to: [{ email: 'nirmalvaja123@gmail.com' }],
          subject: 'Sending with Twilio SendGrid'
        }
      ],
      from: { email: 'nirav.darji@neosoftmail.com' },
      content: [
        {
          type: 'text/html',
          value: "<p>Hello from Twilio SendGrid!</p><p>Sending with the email service trusted by developers and marketers for <strong>time-savings</strong>, <strong>scalability</strong>, and <strong>delivery expertise</strong>.</p><p>%open-track%</p><p>Click <a href=\"https://www.google.com\">here</a> to visit the link.</p>"
        }
      ],
      tracking_settings: {
        click_tracking: { enable: true, enable_text: true },
        open_tracking: { enable: true, substitution_tag: '%opentrack%' },
        subscription_tracking: { enable: false },
        bounce_tracking: { enable: true }
      }
    }

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: data.to_json)

    response.status_code == '202'
  rescue StandardError => e
    Rails.logger.error "Error sending email: #{e.message}"
    false
  end
end